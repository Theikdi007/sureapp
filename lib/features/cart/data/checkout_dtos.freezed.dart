// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartLineDto {

 String get id; String get productId; String get sku; String get title; String? get variantLabel; String? get imageUrl; int get qty; Money get unitPrice; Money get lineTotal; bool get inStock; String? get problem;
/// Create a copy of CartLineDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartLineDtoCopyWith<CartLineDto> get copyWith => _$CartLineDtoCopyWithImpl<CartLineDto>(this as CartLineDto, _$identity);

  /// Serializes this CartLineDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CartLineDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartLineDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.productId, _this.productId) || other.productId == _this.productId)&&(identical(other.sku, _this.sku) || other.sku == _this.sku)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.variantLabel, _this.variantLabel) || other.variantLabel == _this.variantLabel)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.qty, _this.qty) || other.qty == _this.qty)&&(identical(other.unitPrice, _this.unitPrice) || other.unitPrice == _this.unitPrice)&&(identical(other.lineTotal, _this.lineTotal) || other.lineTotal == _this.lineTotal)&&(identical(other.inStock, _this.inStock) || other.inStock == _this.inStock)&&(identical(other.problem, _this.problem) || other.problem == _this.problem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CartLineDto;
  return Object.hash(runtimeType,_this.id,_this.productId,_this.sku,_this.title,_this.variantLabel,_this.imageUrl,_this.qty,_this.unitPrice,_this.lineTotal,_this.inStock,_this.problem);
}

@override
String toString() {
  final _this = this as CartLineDto;
  return 'CartLineDto(id: ${_this.id}, productId: ${_this.productId}, sku: ${_this.sku}, title: ${_this.title}, variantLabel: ${_this.variantLabel}, imageUrl: ${_this.imageUrl}, qty: ${_this.qty}, unitPrice: ${_this.unitPrice}, lineTotal: ${_this.lineTotal}, inStock: ${_this.inStock}, problem: ${_this.problem})';
}


}

/// @nodoc
abstract mixin class $CartLineDtoCopyWith<$Res>  {
  factory $CartLineDtoCopyWith(CartLineDto value, $Res Function(CartLineDto) _then) = _$CartLineDtoCopyWithImpl;
@useResult
$Res call({
 String id, String productId, String sku, String title, String? variantLabel, String? imageUrl, int qty, Money unitPrice, Money lineTotal, bool inStock, String? problem
});


$MoneyCopyWith<$Res> get unitPrice;$MoneyCopyWith<$Res> get lineTotal;

}
/// @nodoc
class _$CartLineDtoCopyWithImpl<$Res>
    implements $CartLineDtoCopyWith<$Res> {
  _$CartLineDtoCopyWithImpl(this._self, this._then);

  final CartLineDto _self;
  final $Res Function(CartLineDto) _then;

/// Create a copy of CartLineDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? productId = null,Object? sku = null,Object? title = null,Object? variantLabel = freezed,Object? imageUrl = freezed,Object? qty = null,Object? unitPrice = null,Object? lineTotal = null,Object? inStock = null,Object? problem = freezed,}) {
  return _then(CartLineDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,variantLabel: freezed == variantLabel ? _self.variantLabel : variantLabel // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as Money,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as Money,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,problem: freezed == problem ? _self.problem : problem // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CartLineDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get unitPrice {
  
  return $MoneyCopyWith<$Res>(_self.unitPrice, (value) {
    return _then(_self.copyWith(unitPrice: value));
  });
}/// Create a copy of CartLineDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get lineTotal {
  
  return $MoneyCopyWith<$Res>(_self.lineTotal, (value) {
    return _then(_self.copyWith(lineTotal: value));
  });
}
}


/// Adds pattern-matching-related methods to [CartLineDto].
extension CartLineDtoPatterns on CartLineDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartLineDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartLineDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartLineDto value)  $default,){
final _that = this;
switch (_that) {
case _CartLineDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartLineDto value)?  $default,){
final _that = this;
switch (_that) {
case _CartLineDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String productId,  String sku,  String title,  String? variantLabel,  String? imageUrl,  int qty,  Money unitPrice,  Money lineTotal,  bool inStock,  String? problem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartLineDto() when $default != null:
return $default(_that.id,_that.productId,_that.sku,_that.title,_that.variantLabel,_that.imageUrl,_that.qty,_that.unitPrice,_that.lineTotal,_that.inStock,_that.problem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String productId,  String sku,  String title,  String? variantLabel,  String? imageUrl,  int qty,  Money unitPrice,  Money lineTotal,  bool inStock,  String? problem)  $default,) {final _that = this;
switch (_that) {
case _CartLineDto():
return $default(_that.id,_that.productId,_that.sku,_that.title,_that.variantLabel,_that.imageUrl,_that.qty,_that.unitPrice,_that.lineTotal,_that.inStock,_that.problem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String productId,  String sku,  String title,  String? variantLabel,  String? imageUrl,  int qty,  Money unitPrice,  Money lineTotal,  bool inStock,  String? problem)?  $default,) {final _that = this;
switch (_that) {
case _CartLineDto() when $default != null:
return $default(_that.id,_that.productId,_that.sku,_that.title,_that.variantLabel,_that.imageUrl,_that.qty,_that.unitPrice,_that.lineTotal,_that.inStock,_that.problem);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartLineDto implements CartLineDto {
  const _CartLineDto({required this.id, required this.productId, required this.sku, required this.title, this.variantLabel, this.imageUrl, required this.qty, required this.unitPrice, required this.lineTotal, this.inStock = true, this.problem});
  factory _CartLineDto.fromJson(Map<String, dynamic> json) => _$CartLineDtoFromJson(json);

@override final  String id;
@override final  String productId;
@override final  String sku;
@override final  String title;
@override final  String? variantLabel;
@override final  String? imageUrl;
@override final  int qty;
@override final  Money unitPrice;
@override final  Money lineTotal;
@override@JsonKey() final  bool inStock;
@override final  String? problem;

/// Create a copy of CartLineDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartLineDtoCopyWith<_CartLineDto> get copyWith => __$CartLineDtoCopyWithImpl<_CartLineDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartLineDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartLineDto&&(identical(other.id, id) || other.id == id)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.title, title) || other.title == title)&&(identical(other.variantLabel, variantLabel) || other.variantLabel == variantLabel)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal)&&(identical(other.inStock, inStock) || other.inStock == inStock)&&(identical(other.problem, problem) || other.problem == problem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,productId,sku,title,variantLabel,imageUrl,qty,unitPrice,lineTotal,inStock,problem);
}

@override
String toString() {
    return 'CartLineDto(id: $id, productId: $productId, sku: $sku, title: $title, variantLabel: $variantLabel, imageUrl: $imageUrl, qty: $qty, unitPrice: $unitPrice, lineTotal: $lineTotal, inStock: $inStock, problem: $problem)';
}


}

/// @nodoc
abstract mixin class _$CartLineDtoCopyWith<$Res> implements $CartLineDtoCopyWith<$Res> {
  factory _$CartLineDtoCopyWith(_CartLineDto value, $Res Function(_CartLineDto) _then) = __$CartLineDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String productId, String sku, String title, String? variantLabel, String? imageUrl, int qty, Money unitPrice, Money lineTotal, bool inStock, String? problem
});


@override $MoneyCopyWith<$Res> get unitPrice;@override $MoneyCopyWith<$Res> get lineTotal;

}
/// @nodoc
class __$CartLineDtoCopyWithImpl<$Res>
    implements _$CartLineDtoCopyWith<$Res> {
  __$CartLineDtoCopyWithImpl(this._self, this._then);

  final _CartLineDto _self;
  final $Res Function(_CartLineDto) _then;

/// Create a copy of CartLineDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? productId = null,Object? sku = null,Object? title = null,Object? variantLabel = freezed,Object? imageUrl = freezed,Object? qty = null,Object? unitPrice = null,Object? lineTotal = null,Object? inStock = null,Object? problem = freezed,}) {
  return _then(_CartLineDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,variantLabel: freezed == variantLabel ? _self.variantLabel : variantLabel // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as Money,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as Money,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,problem: freezed == problem ? _self.problem : problem // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CartLineDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get unitPrice {
  
  return $MoneyCopyWith<$Res>(_self.unitPrice, (value) {
    return _then(_self.copyWith(unitPrice: value));
  });
}/// Create a copy of CartLineDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get lineTotal {
  
  return $MoneyCopyWith<$Res>(_self.lineTotal, (value) {
    return _then(_self.copyWith(lineTotal: value));
  });
}
}


/// @nodoc
mixin _$CartDto {

 List<CartLineDto> get lines; int get itemCount; Money get subtotal;
/// Create a copy of CartDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartDtoCopyWith<CartDto> get copyWith => _$CartDtoCopyWithImpl<CartDto>(this as CartDto, _$identity);

  /// Serializes this CartDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CartDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartDto&&const DeepCollectionEquality().equals(other.lines, _this.lines)&&(identical(other.itemCount, _this.itemCount) || other.itemCount == _this.itemCount)&&(identical(other.subtotal, _this.subtotal) || other.subtotal == _this.subtotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CartDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.lines),_this.itemCount,_this.subtotal);
}

@override
String toString() {
  final _this = this as CartDto;
  return 'CartDto(lines: ${_this.lines}, itemCount: ${_this.itemCount}, subtotal: ${_this.subtotal})';
}


}

/// @nodoc
abstract mixin class $CartDtoCopyWith<$Res>  {
  factory $CartDtoCopyWith(CartDto value, $Res Function(CartDto) _then) = _$CartDtoCopyWithImpl;
@useResult
$Res call({
 List<CartLineDto> lines, int itemCount, Money subtotal
});


$MoneyCopyWith<$Res> get subtotal;

}
/// @nodoc
class _$CartDtoCopyWithImpl<$Res>
    implements $CartDtoCopyWith<$Res> {
  _$CartDtoCopyWithImpl(this._self, this._then);

  final CartDto _self;
  final $Res Function(CartDto) _then;

/// Create a copy of CartDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lines = null,Object? itemCount = null,Object? subtotal = null,}) {
  return _then(CartDto(
lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<CartLineDto>,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}
/// Create a copy of CartDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get subtotal {
  
  return $MoneyCopyWith<$Res>(_self.subtotal, (value) {
    return _then(_self.copyWith(subtotal: value));
  });
}
}


/// Adds pattern-matching-related methods to [CartDto].
extension CartDtoPatterns on CartDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartDto value)  $default,){
final _that = this;
switch (_that) {
case _CartDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartDto value)?  $default,){
final _that = this;
switch (_that) {
case _CartDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CartLineDto> lines,  int itemCount,  Money subtotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartDto() when $default != null:
return $default(_that.lines,_that.itemCount,_that.subtotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CartLineDto> lines,  int itemCount,  Money subtotal)  $default,) {final _that = this;
switch (_that) {
case _CartDto():
return $default(_that.lines,_that.itemCount,_that.subtotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CartLineDto> lines,  int itemCount,  Money subtotal)?  $default,) {final _that = this;
switch (_that) {
case _CartDto() when $default != null:
return $default(_that.lines,_that.itemCount,_that.subtotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartDto implements CartDto {
  const _CartDto({ List<CartLineDto> lines = const [], this.itemCount = 0, required this.subtotal}): _lines = lines;
  factory _CartDto.fromJson(Map<String, dynamic> json) => _$CartDtoFromJson(json);

 final  List<CartLineDto> _lines;
@override@JsonKey() List<CartLineDto> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

@override@JsonKey() final  int itemCount;
@override final  Money subtotal;

/// Create a copy of CartDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartDtoCopyWith<_CartDto> get copyWith => __$CartDtoCopyWithImpl<_CartDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartDto&&const DeepCollectionEquality().equals(other.lines, _lines)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_lines),itemCount,subtotal);
}

@override
String toString() {
    return 'CartDto(lines: $lines, itemCount: $itemCount, subtotal: $subtotal)';
}


}

/// @nodoc
abstract mixin class _$CartDtoCopyWith<$Res> implements $CartDtoCopyWith<$Res> {
  factory _$CartDtoCopyWith(_CartDto value, $Res Function(_CartDto) _then) = __$CartDtoCopyWithImpl;
@override @useResult
$Res call({
 List<CartLineDto> lines, int itemCount, Money subtotal
});


@override $MoneyCopyWith<$Res> get subtotal;

}
/// @nodoc
class __$CartDtoCopyWithImpl<$Res>
    implements _$CartDtoCopyWith<$Res> {
  __$CartDtoCopyWithImpl(this._self, this._then);

  final _CartDto _self;
  final $Res Function(_CartDto) _then;

/// Create a copy of CartDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lines = null,Object? itemCount = null,Object? subtotal = null,}) {
  return _then(_CartDto(
lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<CartLineDto>,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of CartDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get subtotal {
  
  return $MoneyCopyWith<$Res>(_self.subtotal, (value) {
    return _then(_self.copyWith(subtotal: value));
  });
}
}


/// @nodoc
mixin _$HomeSetupChoice {

 String get date; String get slot;
/// Create a copy of HomeSetupChoice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeSetupChoiceCopyWith<HomeSetupChoice> get copyWith => _$HomeSetupChoiceCopyWithImpl<HomeSetupChoice>(this as HomeSetupChoice, _$identity);

  /// Serializes this HomeSetupChoice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HomeSetupChoice;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeSetupChoice&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.slot, _this.slot) || other.slot == _this.slot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HomeSetupChoice;
  return Object.hash(runtimeType,_this.date,_this.slot);
}

@override
String toString() {
  final _this = this as HomeSetupChoice;
  return 'HomeSetupChoice(date: ${_this.date}, slot: ${_this.slot})';
}


}

/// @nodoc
abstract mixin class $HomeSetupChoiceCopyWith<$Res>  {
  factory $HomeSetupChoiceCopyWith(HomeSetupChoice value, $Res Function(HomeSetupChoice) _then) = _$HomeSetupChoiceCopyWithImpl;
@useResult
$Res call({
 String date, String slot
});




}
/// @nodoc
class _$HomeSetupChoiceCopyWithImpl<$Res>
    implements $HomeSetupChoiceCopyWith<$Res> {
  _$HomeSetupChoiceCopyWithImpl(this._self, this._then);

  final HomeSetupChoice _self;
  final $Res Function(HomeSetupChoice) _then;

/// Create a copy of HomeSetupChoice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? slot = null,}) {
  return _then(HomeSetupChoice(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeSetupChoice].
extension HomeSetupChoicePatterns on HomeSetupChoice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeSetupChoice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeSetupChoice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeSetupChoice value)  $default,){
final _that = this;
switch (_that) {
case _HomeSetupChoice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeSetupChoice value)?  $default,){
final _that = this;
switch (_that) {
case _HomeSetupChoice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  String slot)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeSetupChoice() when $default != null:
return $default(_that.date,_that.slot);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  String slot)  $default,) {final _that = this;
switch (_that) {
case _HomeSetupChoice():
return $default(_that.date,_that.slot);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  String slot)?  $default,) {final _that = this;
switch (_that) {
case _HomeSetupChoice() when $default != null:
return $default(_that.date,_that.slot);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeSetupChoice implements HomeSetupChoice {
  const _HomeSetupChoice({required this.date, required this.slot});
  factory _HomeSetupChoice.fromJson(Map<String, dynamic> json) => _$HomeSetupChoiceFromJson(json);

@override final  String date;
@override final  String slot;

/// Create a copy of HomeSetupChoice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeSetupChoiceCopyWith<_HomeSetupChoice> get copyWith => __$HomeSetupChoiceCopyWithImpl<_HomeSetupChoice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeSetupChoiceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeSetupChoice&&(identical(other.date, date) || other.date == date)&&(identical(other.slot, slot) || other.slot == slot));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,date,slot);
}

@override
String toString() {
    return 'HomeSetupChoice(date: $date, slot: $slot)';
}


}

/// @nodoc
abstract mixin class _$HomeSetupChoiceCopyWith<$Res> implements $HomeSetupChoiceCopyWith<$Res> {
  factory _$HomeSetupChoiceCopyWith(_HomeSetupChoice value, $Res Function(_HomeSetupChoice) _then) = __$HomeSetupChoiceCopyWithImpl;
@override @useResult
$Res call({
 String date, String slot
});




}
/// @nodoc
class __$HomeSetupChoiceCopyWithImpl<$Res>
    implements _$HomeSetupChoiceCopyWith<$Res> {
  __$HomeSetupChoiceCopyWithImpl(this._self, this._then);

  final _HomeSetupChoice _self;
  final $Res Function(_HomeSetupChoice) _then;

/// Create a copy of HomeSetupChoice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? slot = null,}) {
  return _then(_HomeSetupChoice(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CheckoutRequest {

/// delivery | pickup
 String get mode;/// express | standard (delivery)
 String? get shipping; String? get addressId; String? get storeCode;/// cod (delivery) | pay_at_pickup (pickup)
 String? get payment; HomeSetupChoice? get homeSetup; String? get note;/// The total the member confirmed (placing only).
 num? get expectedTotal;
/// Create a copy of CheckoutRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutRequestCopyWith<CheckoutRequest> get copyWith => _$CheckoutRequestCopyWithImpl<CheckoutRequest>(this as CheckoutRequest, _$identity);

  /// Serializes this CheckoutRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CheckoutRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutRequest&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.shipping, _this.shipping) || other.shipping == _this.shipping)&&(identical(other.addressId, _this.addressId) || other.addressId == _this.addressId)&&(identical(other.storeCode, _this.storeCode) || other.storeCode == _this.storeCode)&&(identical(other.payment, _this.payment) || other.payment == _this.payment)&&(identical(other.homeSetup, _this.homeSetup) || other.homeSetup == _this.homeSetup)&&(identical(other.note, _this.note) || other.note == _this.note)&&(identical(other.expectedTotal, _this.expectedTotal) || other.expectedTotal == _this.expectedTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CheckoutRequest;
  return Object.hash(runtimeType,_this.mode,_this.shipping,_this.addressId,_this.storeCode,_this.payment,_this.homeSetup,_this.note,_this.expectedTotal);
}

@override
String toString() {
  final _this = this as CheckoutRequest;
  return 'CheckoutRequest(mode: ${_this.mode}, shipping: ${_this.shipping}, addressId: ${_this.addressId}, storeCode: ${_this.storeCode}, payment: ${_this.payment}, homeSetup: ${_this.homeSetup}, note: ${_this.note}, expectedTotal: ${_this.expectedTotal})';
}


}

/// @nodoc
abstract mixin class $CheckoutRequestCopyWith<$Res>  {
  factory $CheckoutRequestCopyWith(CheckoutRequest value, $Res Function(CheckoutRequest) _then) = _$CheckoutRequestCopyWithImpl;
@useResult
$Res call({
 String mode, String? shipping, String? addressId, String? storeCode, String? payment, HomeSetupChoice? homeSetup, String? note, num? expectedTotal
});


$HomeSetupChoiceCopyWith<$Res>? get homeSetup;

}
/// @nodoc
class _$CheckoutRequestCopyWithImpl<$Res>
    implements $CheckoutRequestCopyWith<$Res> {
  _$CheckoutRequestCopyWithImpl(this._self, this._then);

  final CheckoutRequest _self;
  final $Res Function(CheckoutRequest) _then;

/// Create a copy of CheckoutRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? shipping = freezed,Object? addressId = freezed,Object? storeCode = freezed,Object? payment = freezed,Object? homeSetup = freezed,Object? note = freezed,Object? expectedTotal = freezed,}) {
  return _then(CheckoutRequest(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,shipping: freezed == shipping ? _self.shipping : shipping // ignore: cast_nullable_to_non_nullable
as String?,addressId: freezed == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as String?,storeCode: freezed == storeCode ? _self.storeCode : storeCode // ignore: cast_nullable_to_non_nullable
as String?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as String?,homeSetup: freezed == homeSetup ? _self.homeSetup : homeSetup // ignore: cast_nullable_to_non_nullable
as HomeSetupChoice?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,expectedTotal: freezed == expectedTotal ? _self.expectedTotal : expectedTotal // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}
/// Create a copy of CheckoutRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeSetupChoiceCopyWith<$Res>? get homeSetup {
    if (_self.homeSetup == null) {
    return null;
  }

  return $HomeSetupChoiceCopyWith<$Res>(_self.homeSetup!, (value) {
    return _then(_self.copyWith(homeSetup: value));
  });
}
}


/// Adds pattern-matching-related methods to [CheckoutRequest].
extension CheckoutRequestPatterns on CheckoutRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutRequest value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String mode,  String? shipping,  String? addressId,  String? storeCode,  String? payment,  HomeSetupChoice? homeSetup,  String? note,  num? expectedTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutRequest() when $default != null:
return $default(_that.mode,_that.shipping,_that.addressId,_that.storeCode,_that.payment,_that.homeSetup,_that.note,_that.expectedTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String mode,  String? shipping,  String? addressId,  String? storeCode,  String? payment,  HomeSetupChoice? homeSetup,  String? note,  num? expectedTotal)  $default,) {final _that = this;
switch (_that) {
case _CheckoutRequest():
return $default(_that.mode,_that.shipping,_that.addressId,_that.storeCode,_that.payment,_that.homeSetup,_that.note,_that.expectedTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String mode,  String? shipping,  String? addressId,  String? storeCode,  String? payment,  HomeSetupChoice? homeSetup,  String? note,  num? expectedTotal)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutRequest() when $default != null:
return $default(_that.mode,_that.shipping,_that.addressId,_that.storeCode,_that.payment,_that.homeSetup,_that.note,_that.expectedTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutRequest implements CheckoutRequest {
  const _CheckoutRequest({required this.mode, this.shipping, this.addressId, this.storeCode, this.payment, this.homeSetup, this.note, this.expectedTotal});
  factory _CheckoutRequest.fromJson(Map<String, dynamic> json) => _$CheckoutRequestFromJson(json);

/// delivery | pickup
@override final  String mode;
/// express | standard (delivery)
@override final  String? shipping;
@override final  String? addressId;
@override final  String? storeCode;
/// cod (delivery) | pay_at_pickup (pickup)
@override final  String? payment;
@override final  HomeSetupChoice? homeSetup;
@override final  String? note;
/// The total the member confirmed (placing only).
@override final  num? expectedTotal;

/// Create a copy of CheckoutRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutRequestCopyWith<_CheckoutRequest> get copyWith => __$CheckoutRequestCopyWithImpl<_CheckoutRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutRequestToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutRequest&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.shipping, shipping) || other.shipping == shipping)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.storeCode, storeCode) || other.storeCode == storeCode)&&(identical(other.payment, payment) || other.payment == payment)&&(identical(other.homeSetup, homeSetup) || other.homeSetup == homeSetup)&&(identical(other.note, note) || other.note == note)&&(identical(other.expectedTotal, expectedTotal) || other.expectedTotal == expectedTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,mode,shipping,addressId,storeCode,payment,homeSetup,note,expectedTotal);
}

@override
String toString() {
    return 'CheckoutRequest(mode: $mode, shipping: $shipping, addressId: $addressId, storeCode: $storeCode, payment: $payment, homeSetup: $homeSetup, note: $note, expectedTotal: $expectedTotal)';
}


}

/// @nodoc
abstract mixin class _$CheckoutRequestCopyWith<$Res> implements $CheckoutRequestCopyWith<$Res> {
  factory _$CheckoutRequestCopyWith(_CheckoutRequest value, $Res Function(_CheckoutRequest) _then) = __$CheckoutRequestCopyWithImpl;
@override @useResult
$Res call({
 String mode, String? shipping, String? addressId, String? storeCode, String? payment, HomeSetupChoice? homeSetup, String? note, num? expectedTotal
});


@override $HomeSetupChoiceCopyWith<$Res>? get homeSetup;

}
/// @nodoc
class __$CheckoutRequestCopyWithImpl<$Res>
    implements _$CheckoutRequestCopyWith<$Res> {
  __$CheckoutRequestCopyWithImpl(this._self, this._then);

  final _CheckoutRequest _self;
  final $Res Function(_CheckoutRequest) _then;

/// Create a copy of CheckoutRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? shipping = freezed,Object? addressId = freezed,Object? storeCode = freezed,Object? payment = freezed,Object? homeSetup = freezed,Object? note = freezed,Object? expectedTotal = freezed,}) {
  return _then(_CheckoutRequest(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,shipping: freezed == shipping ? _self.shipping : shipping // ignore: cast_nullable_to_non_nullable
as String?,addressId: freezed == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as String?,storeCode: freezed == storeCode ? _self.storeCode : storeCode // ignore: cast_nullable_to_non_nullable
as String?,payment: freezed == payment ? _self.payment : payment // ignore: cast_nullable_to_non_nullable
as String?,homeSetup: freezed == homeSetup ? _self.homeSetup : homeSetup // ignore: cast_nullable_to_non_nullable
as HomeSetupChoice?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,expectedTotal: freezed == expectedTotal ? _self.expectedTotal : expectedTotal // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}

/// Create a copy of CheckoutRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeSetupChoiceCopyWith<$Res>? get homeSetup {
    if (_self.homeSetup == null) {
    return null;
  }

  return $HomeSetupChoiceCopyWith<$Res>(_self.homeSetup!, (value) {
    return _then(_self.copyWith(homeSetup: value));
  });
}
}


/// @nodoc
mixin _$CheckoutLineDto {

 String get sku; String get productId; String get title; String? get imageUrl; int get qty; Money get unitPrice; Money get lineTotal; bool get available; String? get problem;
/// Create a copy of CheckoutLineDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutLineDtoCopyWith<CheckoutLineDto> get copyWith => _$CheckoutLineDtoCopyWithImpl<CheckoutLineDto>(this as CheckoutLineDto, _$identity);

  /// Serializes this CheckoutLineDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CheckoutLineDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutLineDto&&(identical(other.sku, _this.sku) || other.sku == _this.sku)&&(identical(other.productId, _this.productId) || other.productId == _this.productId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.qty, _this.qty) || other.qty == _this.qty)&&(identical(other.unitPrice, _this.unitPrice) || other.unitPrice == _this.unitPrice)&&(identical(other.lineTotal, _this.lineTotal) || other.lineTotal == _this.lineTotal)&&(identical(other.available, _this.available) || other.available == _this.available)&&(identical(other.problem, _this.problem) || other.problem == _this.problem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CheckoutLineDto;
  return Object.hash(runtimeType,_this.sku,_this.productId,_this.title,_this.imageUrl,_this.qty,_this.unitPrice,_this.lineTotal,_this.available,_this.problem);
}

@override
String toString() {
  final _this = this as CheckoutLineDto;
  return 'CheckoutLineDto(sku: ${_this.sku}, productId: ${_this.productId}, title: ${_this.title}, imageUrl: ${_this.imageUrl}, qty: ${_this.qty}, unitPrice: ${_this.unitPrice}, lineTotal: ${_this.lineTotal}, available: ${_this.available}, problem: ${_this.problem})';
}


}

/// @nodoc
abstract mixin class $CheckoutLineDtoCopyWith<$Res>  {
  factory $CheckoutLineDtoCopyWith(CheckoutLineDto value, $Res Function(CheckoutLineDto) _then) = _$CheckoutLineDtoCopyWithImpl;
@useResult
$Res call({
 String sku, String productId, String title, String? imageUrl, int qty, Money unitPrice, Money lineTotal, bool available, String? problem
});


$MoneyCopyWith<$Res> get unitPrice;$MoneyCopyWith<$Res> get lineTotal;

}
/// @nodoc
class _$CheckoutLineDtoCopyWithImpl<$Res>
    implements $CheckoutLineDtoCopyWith<$Res> {
  _$CheckoutLineDtoCopyWithImpl(this._self, this._then);

  final CheckoutLineDto _self;
  final $Res Function(CheckoutLineDto) _then;

/// Create a copy of CheckoutLineDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sku = null,Object? productId = null,Object? title = null,Object? imageUrl = freezed,Object? qty = null,Object? unitPrice = null,Object? lineTotal = null,Object? available = null,Object? problem = freezed,}) {
  return _then(CheckoutLineDto(
sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as Money,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as Money,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,problem: freezed == problem ? _self.problem : problem // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CheckoutLineDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get unitPrice {
  
  return $MoneyCopyWith<$Res>(_self.unitPrice, (value) {
    return _then(_self.copyWith(unitPrice: value));
  });
}/// Create a copy of CheckoutLineDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get lineTotal {
  
  return $MoneyCopyWith<$Res>(_self.lineTotal, (value) {
    return _then(_self.copyWith(lineTotal: value));
  });
}
}


/// Adds pattern-matching-related methods to [CheckoutLineDto].
extension CheckoutLineDtoPatterns on CheckoutLineDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutLineDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutLineDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutLineDto value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutLineDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutLineDto value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutLineDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sku,  String productId,  String title,  String? imageUrl,  int qty,  Money unitPrice,  Money lineTotal,  bool available,  String? problem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutLineDto() when $default != null:
return $default(_that.sku,_that.productId,_that.title,_that.imageUrl,_that.qty,_that.unitPrice,_that.lineTotal,_that.available,_that.problem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sku,  String productId,  String title,  String? imageUrl,  int qty,  Money unitPrice,  Money lineTotal,  bool available,  String? problem)  $default,) {final _that = this;
switch (_that) {
case _CheckoutLineDto():
return $default(_that.sku,_that.productId,_that.title,_that.imageUrl,_that.qty,_that.unitPrice,_that.lineTotal,_that.available,_that.problem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sku,  String productId,  String title,  String? imageUrl,  int qty,  Money unitPrice,  Money lineTotal,  bool available,  String? problem)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutLineDto() when $default != null:
return $default(_that.sku,_that.productId,_that.title,_that.imageUrl,_that.qty,_that.unitPrice,_that.lineTotal,_that.available,_that.problem);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutLineDto implements CheckoutLineDto {
  const _CheckoutLineDto({required this.sku, required this.productId, required this.title, this.imageUrl, required this.qty, required this.unitPrice, required this.lineTotal, this.available = true, this.problem});
  factory _CheckoutLineDto.fromJson(Map<String, dynamic> json) => _$CheckoutLineDtoFromJson(json);

@override final  String sku;
@override final  String productId;
@override final  String title;
@override final  String? imageUrl;
@override final  int qty;
@override final  Money unitPrice;
@override final  Money lineTotal;
@override@JsonKey() final  bool available;
@override final  String? problem;

/// Create a copy of CheckoutLineDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutLineDtoCopyWith<_CheckoutLineDto> get copyWith => __$CheckoutLineDtoCopyWithImpl<_CheckoutLineDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutLineDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutLineDto&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal)&&(identical(other.available, available) || other.available == available)&&(identical(other.problem, problem) || other.problem == problem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,sku,productId,title,imageUrl,qty,unitPrice,lineTotal,available,problem);
}

@override
String toString() {
    return 'CheckoutLineDto(sku: $sku, productId: $productId, title: $title, imageUrl: $imageUrl, qty: $qty, unitPrice: $unitPrice, lineTotal: $lineTotal, available: $available, problem: $problem)';
}


}

/// @nodoc
abstract mixin class _$CheckoutLineDtoCopyWith<$Res> implements $CheckoutLineDtoCopyWith<$Res> {
  factory _$CheckoutLineDtoCopyWith(_CheckoutLineDto value, $Res Function(_CheckoutLineDto) _then) = __$CheckoutLineDtoCopyWithImpl;
@override @useResult
$Res call({
 String sku, String productId, String title, String? imageUrl, int qty, Money unitPrice, Money lineTotal, bool available, String? problem
});


@override $MoneyCopyWith<$Res> get unitPrice;@override $MoneyCopyWith<$Res> get lineTotal;

}
/// @nodoc
class __$CheckoutLineDtoCopyWithImpl<$Res>
    implements _$CheckoutLineDtoCopyWith<$Res> {
  __$CheckoutLineDtoCopyWithImpl(this._self, this._then);

  final _CheckoutLineDto _self;
  final $Res Function(_CheckoutLineDto) _then;

/// Create a copy of CheckoutLineDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sku = null,Object? productId = null,Object? title = null,Object? imageUrl = freezed,Object? qty = null,Object? unitPrice = null,Object? lineTotal = null,Object? available = null,Object? problem = freezed,}) {
  return _then(_CheckoutLineDto(
sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as Money,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as Money,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,problem: freezed == problem ? _self.problem : problem // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CheckoutLineDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get unitPrice {
  
  return $MoneyCopyWith<$Res>(_self.unitPrice, (value) {
    return _then(_self.copyWith(unitPrice: value));
  });
}/// Create a copy of CheckoutLineDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get lineTotal {
  
  return $MoneyCopyWith<$Res>(_self.lineTotal, (value) {
    return _then(_self.copyWith(lineTotal: value));
  });
}
}


/// @nodoc
mixin _$ShippingOptionDto {

 String get code; String get title; String get description; Money get fee; bool get selected; bool get enabled;
/// Create a copy of ShippingOptionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShippingOptionDtoCopyWith<ShippingOptionDto> get copyWith => _$ShippingOptionDtoCopyWithImpl<ShippingOptionDto>(this as ShippingOptionDto, _$identity);

  /// Serializes this ShippingOptionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ShippingOptionDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShippingOptionDto&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.fee, _this.fee) || other.fee == _this.fee)&&(identical(other.selected, _this.selected) || other.selected == _this.selected)&&(identical(other.enabled, _this.enabled) || other.enabled == _this.enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ShippingOptionDto;
  return Object.hash(runtimeType,_this.code,_this.title,_this.description,_this.fee,_this.selected,_this.enabled);
}

@override
String toString() {
  final _this = this as ShippingOptionDto;
  return 'ShippingOptionDto(code: ${_this.code}, title: ${_this.title}, description: ${_this.description}, fee: ${_this.fee}, selected: ${_this.selected}, enabled: ${_this.enabled})';
}


}

/// @nodoc
abstract mixin class $ShippingOptionDtoCopyWith<$Res>  {
  factory $ShippingOptionDtoCopyWith(ShippingOptionDto value, $Res Function(ShippingOptionDto) _then) = _$ShippingOptionDtoCopyWithImpl;
@useResult
$Res call({
 String code, String title, String description, Money fee, bool selected, bool enabled
});


$MoneyCopyWith<$Res> get fee;

}
/// @nodoc
class _$ShippingOptionDtoCopyWithImpl<$Res>
    implements $ShippingOptionDtoCopyWith<$Res> {
  _$ShippingOptionDtoCopyWithImpl(this._self, this._then);

  final ShippingOptionDto _self;
  final $Res Function(ShippingOptionDto) _then;

/// Create a copy of ShippingOptionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? title = null,Object? description = null,Object? fee = null,Object? selected = null,Object? enabled = null,}) {
  return _then(ShippingOptionDto(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as Money,selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as bool,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ShippingOptionDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get fee {
  
  return $MoneyCopyWith<$Res>(_self.fee, (value) {
    return _then(_self.copyWith(fee: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShippingOptionDto].
extension ShippingOptionDtoPatterns on ShippingOptionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShippingOptionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShippingOptionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShippingOptionDto value)  $default,){
final _that = this;
switch (_that) {
case _ShippingOptionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShippingOptionDto value)?  $default,){
final _that = this;
switch (_that) {
case _ShippingOptionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String title,  String description,  Money fee,  bool selected,  bool enabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShippingOptionDto() when $default != null:
return $default(_that.code,_that.title,_that.description,_that.fee,_that.selected,_that.enabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String title,  String description,  Money fee,  bool selected,  bool enabled)  $default,) {final _that = this;
switch (_that) {
case _ShippingOptionDto():
return $default(_that.code,_that.title,_that.description,_that.fee,_that.selected,_that.enabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String title,  String description,  Money fee,  bool selected,  bool enabled)?  $default,) {final _that = this;
switch (_that) {
case _ShippingOptionDto() when $default != null:
return $default(_that.code,_that.title,_that.description,_that.fee,_that.selected,_that.enabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShippingOptionDto implements ShippingOptionDto {
  const _ShippingOptionDto({required this.code, required this.title, required this.description, required this.fee, this.selected = false, this.enabled = true});
  factory _ShippingOptionDto.fromJson(Map<String, dynamic> json) => _$ShippingOptionDtoFromJson(json);

@override final  String code;
@override final  String title;
@override final  String description;
@override final  Money fee;
@override@JsonKey() final  bool selected;
@override@JsonKey() final  bool enabled;

/// Create a copy of ShippingOptionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShippingOptionDtoCopyWith<_ShippingOptionDto> get copyWith => __$ShippingOptionDtoCopyWithImpl<_ShippingOptionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShippingOptionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShippingOptionDto&&(identical(other.code, code) || other.code == code)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.selected, selected) || other.selected == selected)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,code,title,description,fee,selected,enabled);
}

@override
String toString() {
    return 'ShippingOptionDto(code: $code, title: $title, description: $description, fee: $fee, selected: $selected, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$ShippingOptionDtoCopyWith<$Res> implements $ShippingOptionDtoCopyWith<$Res> {
  factory _$ShippingOptionDtoCopyWith(_ShippingOptionDto value, $Res Function(_ShippingOptionDto) _then) = __$ShippingOptionDtoCopyWithImpl;
@override @useResult
$Res call({
 String code, String title, String description, Money fee, bool selected, bool enabled
});


@override $MoneyCopyWith<$Res> get fee;

}
/// @nodoc
class __$ShippingOptionDtoCopyWithImpl<$Res>
    implements _$ShippingOptionDtoCopyWith<$Res> {
  __$ShippingOptionDtoCopyWithImpl(this._self, this._then);

  final _ShippingOptionDto _self;
  final $Res Function(_ShippingOptionDto) _then;

/// Create a copy of ShippingOptionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? title = null,Object? description = null,Object? fee = null,Object? selected = null,Object? enabled = null,}) {
  return _then(_ShippingOptionDto(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as Money,selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as bool,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ShippingOptionDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get fee {
  
  return $MoneyCopyWith<$Res>(_self.fee, (value) {
    return _then(_self.copyWith(fee: value));
  });
}
}


/// @nodoc
mixin _$PickupStoreDto {

 String get code; String get name; String? get address; String? get distance; bool get openNow; bool get selected;
/// Create a copy of PickupStoreDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PickupStoreDtoCopyWith<PickupStoreDto> get copyWith => _$PickupStoreDtoCopyWithImpl<PickupStoreDto>(this as PickupStoreDto, _$identity);

  /// Serializes this PickupStoreDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PickupStoreDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PickupStoreDto&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.distance, _this.distance) || other.distance == _this.distance)&&(identical(other.openNow, _this.openNow) || other.openNow == _this.openNow)&&(identical(other.selected, _this.selected) || other.selected == _this.selected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PickupStoreDto;
  return Object.hash(runtimeType,_this.code,_this.name,_this.address,_this.distance,_this.openNow,_this.selected);
}

@override
String toString() {
  final _this = this as PickupStoreDto;
  return 'PickupStoreDto(code: ${_this.code}, name: ${_this.name}, address: ${_this.address}, distance: ${_this.distance}, openNow: ${_this.openNow}, selected: ${_this.selected})';
}


}

/// @nodoc
abstract mixin class $PickupStoreDtoCopyWith<$Res>  {
  factory $PickupStoreDtoCopyWith(PickupStoreDto value, $Res Function(PickupStoreDto) _then) = _$PickupStoreDtoCopyWithImpl;
@useResult
$Res call({
 String code, String name, String? address, String? distance, bool openNow, bool selected
});




}
/// @nodoc
class _$PickupStoreDtoCopyWithImpl<$Res>
    implements $PickupStoreDtoCopyWith<$Res> {
  _$PickupStoreDtoCopyWithImpl(this._self, this._then);

  final PickupStoreDto _self;
  final $Res Function(PickupStoreDto) _then;

/// Create a copy of PickupStoreDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,Object? address = freezed,Object? distance = freezed,Object? openNow = null,Object? selected = null,}) {
  return _then(PickupStoreDto(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as String?,openNow: null == openNow ? _self.openNow : openNow // ignore: cast_nullable_to_non_nullable
as bool,selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PickupStoreDto].
extension PickupStoreDtoPatterns on PickupStoreDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PickupStoreDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PickupStoreDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PickupStoreDto value)  $default,){
final _that = this;
switch (_that) {
case _PickupStoreDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PickupStoreDto value)?  $default,){
final _that = this;
switch (_that) {
case _PickupStoreDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String name,  String? address,  String? distance,  bool openNow,  bool selected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PickupStoreDto() when $default != null:
return $default(_that.code,_that.name,_that.address,_that.distance,_that.openNow,_that.selected);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String name,  String? address,  String? distance,  bool openNow,  bool selected)  $default,) {final _that = this;
switch (_that) {
case _PickupStoreDto():
return $default(_that.code,_that.name,_that.address,_that.distance,_that.openNow,_that.selected);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String name,  String? address,  String? distance,  bool openNow,  bool selected)?  $default,) {final _that = this;
switch (_that) {
case _PickupStoreDto() when $default != null:
return $default(_that.code,_that.name,_that.address,_that.distance,_that.openNow,_that.selected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PickupStoreDto implements PickupStoreDto {
  const _PickupStoreDto({required this.code, required this.name, this.address, this.distance, this.openNow = true, this.selected = false});
  factory _PickupStoreDto.fromJson(Map<String, dynamic> json) => _$PickupStoreDtoFromJson(json);

@override final  String code;
@override final  String name;
@override final  String? address;
@override final  String? distance;
@override@JsonKey() final  bool openNow;
@override@JsonKey() final  bool selected;

/// Create a copy of PickupStoreDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PickupStoreDtoCopyWith<_PickupStoreDto> get copyWith => __$PickupStoreDtoCopyWithImpl<_PickupStoreDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PickupStoreDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PickupStoreDto&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.openNow, openNow) || other.openNow == openNow)&&(identical(other.selected, selected) || other.selected == selected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,code,name,address,distance,openNow,selected);
}

@override
String toString() {
    return 'PickupStoreDto(code: $code, name: $name, address: $address, distance: $distance, openNow: $openNow, selected: $selected)';
}


}

/// @nodoc
abstract mixin class _$PickupStoreDtoCopyWith<$Res> implements $PickupStoreDtoCopyWith<$Res> {
  factory _$PickupStoreDtoCopyWith(_PickupStoreDto value, $Res Function(_PickupStoreDto) _then) = __$PickupStoreDtoCopyWithImpl;
@override @useResult
$Res call({
 String code, String name, String? address, String? distance, bool openNow, bool selected
});




}
/// @nodoc
class __$PickupStoreDtoCopyWithImpl<$Res>
    implements _$PickupStoreDtoCopyWith<$Res> {
  __$PickupStoreDtoCopyWithImpl(this._self, this._then);

  final _PickupStoreDto _self;
  final $Res Function(_PickupStoreDto) _then;

/// Create a copy of PickupStoreDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,Object? address = freezed,Object? distance = freezed,Object? openNow = null,Object? selected = null,}) {
  return _then(_PickupStoreDto(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as String?,openNow: null == openNow ? _self.openNow : openNow // ignore: cast_nullable_to_non_nullable
as bool,selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as bool,
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
  const _PaymentMethodDto({required this.code, required this.title, required this.description, this.enabled = true, this.isDefault = false, this.disabledReason});
  factory _PaymentMethodDto.fromJson(Map<String, dynamic> json) => _$PaymentMethodDtoFromJson(json);

@override final  String code;
@override final  String title;
@override final  String description;
@override@JsonKey() final  bool enabled;
@override@JsonKey() final  bool isDefault;
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


/// @nodoc
mixin _$HomeSetupSlotDto {

 String get slot; String get label; bool get available;
/// Create a copy of HomeSetupSlotDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeSetupSlotDtoCopyWith<HomeSetupSlotDto> get copyWith => _$HomeSetupSlotDtoCopyWithImpl<HomeSetupSlotDto>(this as HomeSetupSlotDto, _$identity);

  /// Serializes this HomeSetupSlotDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HomeSetupSlotDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeSetupSlotDto&&(identical(other.slot, _this.slot) || other.slot == _this.slot)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.available, _this.available) || other.available == _this.available));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HomeSetupSlotDto;
  return Object.hash(runtimeType,_this.slot,_this.label,_this.available);
}

@override
String toString() {
  final _this = this as HomeSetupSlotDto;
  return 'HomeSetupSlotDto(slot: ${_this.slot}, label: ${_this.label}, available: ${_this.available})';
}


}

/// @nodoc
abstract mixin class $HomeSetupSlotDtoCopyWith<$Res>  {
  factory $HomeSetupSlotDtoCopyWith(HomeSetupSlotDto value, $Res Function(HomeSetupSlotDto) _then) = _$HomeSetupSlotDtoCopyWithImpl;
@useResult
$Res call({
 String slot, String label, bool available
});




}
/// @nodoc
class _$HomeSetupSlotDtoCopyWithImpl<$Res>
    implements $HomeSetupSlotDtoCopyWith<$Res> {
  _$HomeSetupSlotDtoCopyWithImpl(this._self, this._then);

  final HomeSetupSlotDto _self;
  final $Res Function(HomeSetupSlotDto) _then;

/// Create a copy of HomeSetupSlotDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slot = null,Object? label = null,Object? available = null,}) {
  return _then(HomeSetupSlotDto(
slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeSetupSlotDto].
extension HomeSetupSlotDtoPatterns on HomeSetupSlotDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeSetupSlotDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeSetupSlotDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeSetupSlotDto value)  $default,){
final _that = this;
switch (_that) {
case _HomeSetupSlotDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeSetupSlotDto value)?  $default,){
final _that = this;
switch (_that) {
case _HomeSetupSlotDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String slot,  String label,  bool available)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeSetupSlotDto() when $default != null:
return $default(_that.slot,_that.label,_that.available);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String slot,  String label,  bool available)  $default,) {final _that = this;
switch (_that) {
case _HomeSetupSlotDto():
return $default(_that.slot,_that.label,_that.available);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String slot,  String label,  bool available)?  $default,) {final _that = this;
switch (_that) {
case _HomeSetupSlotDto() when $default != null:
return $default(_that.slot,_that.label,_that.available);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeSetupSlotDto implements HomeSetupSlotDto {
  const _HomeSetupSlotDto({required this.slot, required this.label, this.available = true});
  factory _HomeSetupSlotDto.fromJson(Map<String, dynamic> json) => _$HomeSetupSlotDtoFromJson(json);

@override final  String slot;
@override final  String label;
@override@JsonKey() final  bool available;

/// Create a copy of HomeSetupSlotDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeSetupSlotDtoCopyWith<_HomeSetupSlotDto> get copyWith => __$HomeSetupSlotDtoCopyWithImpl<_HomeSetupSlotDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeSetupSlotDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeSetupSlotDto&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.label, label) || other.label == label)&&(identical(other.available, available) || other.available == available));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,slot,label,available);
}

@override
String toString() {
    return 'HomeSetupSlotDto(slot: $slot, label: $label, available: $available)';
}


}

/// @nodoc
abstract mixin class _$HomeSetupSlotDtoCopyWith<$Res> implements $HomeSetupSlotDtoCopyWith<$Res> {
  factory _$HomeSetupSlotDtoCopyWith(_HomeSetupSlotDto value, $Res Function(_HomeSetupSlotDto) _then) = __$HomeSetupSlotDtoCopyWithImpl;
@override @useResult
$Res call({
 String slot, String label, bool available
});




}
/// @nodoc
class __$HomeSetupSlotDtoCopyWithImpl<$Res>
    implements _$HomeSetupSlotDtoCopyWith<$Res> {
  __$HomeSetupSlotDtoCopyWithImpl(this._self, this._then);

  final _HomeSetupSlotDto _self;
  final $Res Function(_HomeSetupSlotDto) _then;

/// Create a copy of HomeSetupSlotDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slot = null,Object? label = null,Object? available = null,}) {
  return _then(_HomeSetupSlotDto(
slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$HomeSetupSlotDayDto {

 String get date; String get weekday; String get day;@JsonKey(fromJson: _uniqueSlots) List<HomeSetupSlotDto> get slots;
/// Create a copy of HomeSetupSlotDayDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeSetupSlotDayDtoCopyWith<HomeSetupSlotDayDto> get copyWith => _$HomeSetupSlotDayDtoCopyWithImpl<HomeSetupSlotDayDto>(this as HomeSetupSlotDayDto, _$identity);

  /// Serializes this HomeSetupSlotDayDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HomeSetupSlotDayDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeSetupSlotDayDto&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.weekday, _this.weekday) || other.weekday == _this.weekday)&&(identical(other.day, _this.day) || other.day == _this.day)&&const DeepCollectionEquality().equals(other.slots, _this.slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HomeSetupSlotDayDto;
  return Object.hash(runtimeType,_this.date,_this.weekday,_this.day,const DeepCollectionEquality().hash(_this.slots));
}

@override
String toString() {
  final _this = this as HomeSetupSlotDayDto;
  return 'HomeSetupSlotDayDto(date: ${_this.date}, weekday: ${_this.weekday}, day: ${_this.day}, slots: ${_this.slots})';
}


}

/// @nodoc
abstract mixin class $HomeSetupSlotDayDtoCopyWith<$Res>  {
  factory $HomeSetupSlotDayDtoCopyWith(HomeSetupSlotDayDto value, $Res Function(HomeSetupSlotDayDto) _then) = _$HomeSetupSlotDayDtoCopyWithImpl;
@useResult
$Res call({
 String date, String weekday, String day,@JsonKey(fromJson: _uniqueSlots) List<HomeSetupSlotDto> slots
});




}
/// @nodoc
class _$HomeSetupSlotDayDtoCopyWithImpl<$Res>
    implements $HomeSetupSlotDayDtoCopyWith<$Res> {
  _$HomeSetupSlotDayDtoCopyWithImpl(this._self, this._then);

  final HomeSetupSlotDayDto _self;
  final $Res Function(HomeSetupSlotDayDto) _then;

/// Create a copy of HomeSetupSlotDayDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? weekday = null,Object? day = null,Object? slots = null,}) {
  return _then(HomeSetupSlotDayDto(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,weekday: null == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<HomeSetupSlotDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeSetupSlotDayDto].
extension HomeSetupSlotDayDtoPatterns on HomeSetupSlotDayDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeSetupSlotDayDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeSetupSlotDayDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeSetupSlotDayDto value)  $default,){
final _that = this;
switch (_that) {
case _HomeSetupSlotDayDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeSetupSlotDayDto value)?  $default,){
final _that = this;
switch (_that) {
case _HomeSetupSlotDayDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  String weekday,  String day, @JsonKey(fromJson: _uniqueSlots)  List<HomeSetupSlotDto> slots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeSetupSlotDayDto() when $default != null:
return $default(_that.date,_that.weekday,_that.day,_that.slots);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  String weekday,  String day, @JsonKey(fromJson: _uniqueSlots)  List<HomeSetupSlotDto> slots)  $default,) {final _that = this;
switch (_that) {
case _HomeSetupSlotDayDto():
return $default(_that.date,_that.weekday,_that.day,_that.slots);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  String weekday,  String day, @JsonKey(fromJson: _uniqueSlots)  List<HomeSetupSlotDto> slots)?  $default,) {final _that = this;
switch (_that) {
case _HomeSetupSlotDayDto() when $default != null:
return $default(_that.date,_that.weekday,_that.day,_that.slots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeSetupSlotDayDto implements HomeSetupSlotDayDto {
  const _HomeSetupSlotDayDto({required this.date, required this.weekday, required this.day, @JsonKey(fromJson: _uniqueSlots)  List<HomeSetupSlotDto> slots = const []}): _slots = slots;
  factory _HomeSetupSlotDayDto.fromJson(Map<String, dynamic> json) => _$HomeSetupSlotDayDtoFromJson(json);

@override final  String date;
@override final  String weekday;
@override final  String day;
 final  List<HomeSetupSlotDto> _slots;
@override@JsonKey(fromJson: _uniqueSlots) List<HomeSetupSlotDto> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}


/// Create a copy of HomeSetupSlotDayDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeSetupSlotDayDtoCopyWith<_HomeSetupSlotDayDto> get copyWith => __$HomeSetupSlotDayDtoCopyWithImpl<_HomeSetupSlotDayDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeSetupSlotDayDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeSetupSlotDayDto&&(identical(other.date, date) || other.date == date)&&(identical(other.weekday, weekday) || other.weekday == weekday)&&(identical(other.day, day) || other.day == day)&&const DeepCollectionEquality().equals(other.slots, _slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,date,weekday,day,const DeepCollectionEquality().hash(_slots));
}

@override
String toString() {
    return 'HomeSetupSlotDayDto(date: $date, weekday: $weekday, day: $day, slots: $slots)';
}


}

/// @nodoc
abstract mixin class _$HomeSetupSlotDayDtoCopyWith<$Res> implements $HomeSetupSlotDayDtoCopyWith<$Res> {
  factory _$HomeSetupSlotDayDtoCopyWith(_HomeSetupSlotDayDto value, $Res Function(_HomeSetupSlotDayDto) _then) = __$HomeSetupSlotDayDtoCopyWithImpl;
@override @useResult
$Res call({
 String date, String weekday, String day,@JsonKey(fromJson: _uniqueSlots) List<HomeSetupSlotDto> slots
});




}
/// @nodoc
class __$HomeSetupSlotDayDtoCopyWithImpl<$Res>
    implements _$HomeSetupSlotDayDtoCopyWith<$Res> {
  __$HomeSetupSlotDayDtoCopyWithImpl(this._self, this._then);

  final _HomeSetupSlotDayDto _self;
  final $Res Function(_HomeSetupSlotDayDto) _then;

/// Create a copy of HomeSetupSlotDayDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? weekday = null,Object? day = null,Object? slots = null,}) {
  return _then(_HomeSetupSlotDayDto(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,weekday: null == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as String,day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as String,slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<HomeSetupSlotDto>,
  ));
}


}


/// @nodoc
mixin _$CheckoutPointsDto {

 int get balance; int get estimatedEarn; bool get canRedeem; String get hint;
/// Create a copy of CheckoutPointsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutPointsDtoCopyWith<CheckoutPointsDto> get copyWith => _$CheckoutPointsDtoCopyWithImpl<CheckoutPointsDto>(this as CheckoutPointsDto, _$identity);

  /// Serializes this CheckoutPointsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CheckoutPointsDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutPointsDto&&(identical(other.balance, _this.balance) || other.balance == _this.balance)&&(identical(other.estimatedEarn, _this.estimatedEarn) || other.estimatedEarn == _this.estimatedEarn)&&(identical(other.canRedeem, _this.canRedeem) || other.canRedeem == _this.canRedeem)&&(identical(other.hint, _this.hint) || other.hint == _this.hint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CheckoutPointsDto;
  return Object.hash(runtimeType,_this.balance,_this.estimatedEarn,_this.canRedeem,_this.hint);
}

@override
String toString() {
  final _this = this as CheckoutPointsDto;
  return 'CheckoutPointsDto(balance: ${_this.balance}, estimatedEarn: ${_this.estimatedEarn}, canRedeem: ${_this.canRedeem}, hint: ${_this.hint})';
}


}

/// @nodoc
abstract mixin class $CheckoutPointsDtoCopyWith<$Res>  {
  factory $CheckoutPointsDtoCopyWith(CheckoutPointsDto value, $Res Function(CheckoutPointsDto) _then) = _$CheckoutPointsDtoCopyWithImpl;
@useResult
$Res call({
 int balance, int estimatedEarn, bool canRedeem, String hint
});




}
/// @nodoc
class _$CheckoutPointsDtoCopyWithImpl<$Res>
    implements $CheckoutPointsDtoCopyWith<$Res> {
  _$CheckoutPointsDtoCopyWithImpl(this._self, this._then);

  final CheckoutPointsDto _self;
  final $Res Function(CheckoutPointsDto) _then;

/// Create a copy of CheckoutPointsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? balance = null,Object? estimatedEarn = null,Object? canRedeem = null,Object? hint = null,}) {
  return _then(CheckoutPointsDto(
balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,estimatedEarn: null == estimatedEarn ? _self.estimatedEarn : estimatedEarn // ignore: cast_nullable_to_non_nullable
as int,canRedeem: null == canRedeem ? _self.canRedeem : canRedeem // ignore: cast_nullable_to_non_nullable
as bool,hint: null == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutPointsDto].
extension CheckoutPointsDtoPatterns on CheckoutPointsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutPointsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutPointsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutPointsDto value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutPointsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutPointsDto value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutPointsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int balance,  int estimatedEarn,  bool canRedeem,  String hint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutPointsDto() when $default != null:
return $default(_that.balance,_that.estimatedEarn,_that.canRedeem,_that.hint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int balance,  int estimatedEarn,  bool canRedeem,  String hint)  $default,) {final _that = this;
switch (_that) {
case _CheckoutPointsDto():
return $default(_that.balance,_that.estimatedEarn,_that.canRedeem,_that.hint);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int balance,  int estimatedEarn,  bool canRedeem,  String hint)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutPointsDto() when $default != null:
return $default(_that.balance,_that.estimatedEarn,_that.canRedeem,_that.hint);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutPointsDto implements CheckoutPointsDto {
  const _CheckoutPointsDto({this.balance = 0, this.estimatedEarn = 0, this.canRedeem = false, this.hint = ''});
  factory _CheckoutPointsDto.fromJson(Map<String, dynamic> json) => _$CheckoutPointsDtoFromJson(json);

@override@JsonKey() final  int balance;
@override@JsonKey() final  int estimatedEarn;
@override@JsonKey() final  bool canRedeem;
@override@JsonKey() final  String hint;

/// Create a copy of CheckoutPointsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutPointsDtoCopyWith<_CheckoutPointsDto> get copyWith => __$CheckoutPointsDtoCopyWithImpl<_CheckoutPointsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutPointsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutPointsDto&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.estimatedEarn, estimatedEarn) || other.estimatedEarn == estimatedEarn)&&(identical(other.canRedeem, canRedeem) || other.canRedeem == canRedeem)&&(identical(other.hint, hint) || other.hint == hint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,balance,estimatedEarn,canRedeem,hint);
}

@override
String toString() {
    return 'CheckoutPointsDto(balance: $balance, estimatedEarn: $estimatedEarn, canRedeem: $canRedeem, hint: $hint)';
}


}

/// @nodoc
abstract mixin class _$CheckoutPointsDtoCopyWith<$Res> implements $CheckoutPointsDtoCopyWith<$Res> {
  factory _$CheckoutPointsDtoCopyWith(_CheckoutPointsDto value, $Res Function(_CheckoutPointsDto) _then) = __$CheckoutPointsDtoCopyWithImpl;
@override @useResult
$Res call({
 int balance, int estimatedEarn, bool canRedeem, String hint
});




}
/// @nodoc
class __$CheckoutPointsDtoCopyWithImpl<$Res>
    implements _$CheckoutPointsDtoCopyWith<$Res> {
  __$CheckoutPointsDtoCopyWithImpl(this._self, this._then);

  final _CheckoutPointsDto _self;
  final $Res Function(_CheckoutPointsDto) _then;

/// Create a copy of CheckoutPointsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? balance = null,Object? estimatedEarn = null,Object? canRedeem = null,Object? hint = null,}) {
  return _then(_CheckoutPointsDto(
balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,estimatedEarn: null == estimatedEarn ? _self.estimatedEarn : estimatedEarn // ignore: cast_nullable_to_non_nullable
as int,canRedeem: null == canRedeem ? _self.canRedeem : canRedeem // ignore: cast_nullable_to_non_nullable
as bool,hint: null == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SummaryRowDto {

 String get label; String get value; Money? get amount; bool get positive;
/// Create a copy of SummaryRowDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummaryRowDtoCopyWith<SummaryRowDto> get copyWith => _$SummaryRowDtoCopyWithImpl<SummaryRowDto>(this as SummaryRowDto, _$identity);

  /// Serializes this SummaryRowDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SummaryRowDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SummaryRowDto&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.positive, _this.positive) || other.positive == _this.positive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SummaryRowDto;
  return Object.hash(runtimeType,_this.label,_this.value,_this.amount,_this.positive);
}

@override
String toString() {
  final _this = this as SummaryRowDto;
  return 'SummaryRowDto(label: ${_this.label}, value: ${_this.value}, amount: ${_this.amount}, positive: ${_this.positive})';
}


}

/// @nodoc
abstract mixin class $SummaryRowDtoCopyWith<$Res>  {
  factory $SummaryRowDtoCopyWith(SummaryRowDto value, $Res Function(SummaryRowDto) _then) = _$SummaryRowDtoCopyWithImpl;
@useResult
$Res call({
 String label, String value, Money? amount, bool positive
});


$MoneyCopyWith<$Res>? get amount;

}
/// @nodoc
class _$SummaryRowDtoCopyWithImpl<$Res>
    implements $SummaryRowDtoCopyWith<$Res> {
  _$SummaryRowDtoCopyWithImpl(this._self, this._then);

  final SummaryRowDto _self;
  final $Res Function(SummaryRowDto) _then;

/// Create a copy of SummaryRowDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? value = null,Object? amount = freezed,Object? positive = null,}) {
  return _then(SummaryRowDto(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money?,positive: null == positive ? _self.positive : positive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of SummaryRowDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get amount {
    if (_self.amount == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.amount!, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}


/// Adds pattern-matching-related methods to [SummaryRowDto].
extension SummaryRowDtoPatterns on SummaryRowDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SummaryRowDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SummaryRowDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SummaryRowDto value)  $default,){
final _that = this;
switch (_that) {
case _SummaryRowDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SummaryRowDto value)?  $default,){
final _that = this;
switch (_that) {
case _SummaryRowDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String value,  Money? amount,  bool positive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SummaryRowDto() when $default != null:
return $default(_that.label,_that.value,_that.amount,_that.positive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String value,  Money? amount,  bool positive)  $default,) {final _that = this;
switch (_that) {
case _SummaryRowDto():
return $default(_that.label,_that.value,_that.amount,_that.positive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String value,  Money? amount,  bool positive)?  $default,) {final _that = this;
switch (_that) {
case _SummaryRowDto() when $default != null:
return $default(_that.label,_that.value,_that.amount,_that.positive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SummaryRowDto implements SummaryRowDto {
  const _SummaryRowDto({required this.label, required this.value, this.amount, this.positive = false});
  factory _SummaryRowDto.fromJson(Map<String, dynamic> json) => _$SummaryRowDtoFromJson(json);

@override final  String label;
@override final  String value;
@override final  Money? amount;
@override@JsonKey() final  bool positive;

/// Create a copy of SummaryRowDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SummaryRowDtoCopyWith<_SummaryRowDto> get copyWith => __$SummaryRowDtoCopyWithImpl<_SummaryRowDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SummaryRowDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SummaryRowDto&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.positive, positive) || other.positive == positive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,label,value,amount,positive);
}

@override
String toString() {
    return 'SummaryRowDto(label: $label, value: $value, amount: $amount, positive: $positive)';
}


}

/// @nodoc
abstract mixin class _$SummaryRowDtoCopyWith<$Res> implements $SummaryRowDtoCopyWith<$Res> {
  factory _$SummaryRowDtoCopyWith(_SummaryRowDto value, $Res Function(_SummaryRowDto) _then) = __$SummaryRowDtoCopyWithImpl;
@override @useResult
$Res call({
 String label, String value, Money? amount, bool positive
});


@override $MoneyCopyWith<$Res>? get amount;

}
/// @nodoc
class __$SummaryRowDtoCopyWithImpl<$Res>
    implements _$SummaryRowDtoCopyWith<$Res> {
  __$SummaryRowDtoCopyWithImpl(this._self, this._then);

  final _SummaryRowDto _self;
  final $Res Function(_SummaryRowDto) _then;

/// Create a copy of SummaryRowDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? value = null,Object? amount = freezed,Object? positive = null,}) {
  return _then(_SummaryRowDto(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as Money?,positive: null == positive ? _self.positive : positive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of SummaryRowDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get amount {
    if (_self.amount == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.amount!, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}


/// @nodoc
mixin _$CheckoutDto {

 String get mode; List<CheckoutLineDto> get lines; int get itemCount; AddressDto? get address; List<ShippingOptionDto> get shippingOptions; List<PickupStoreDto> get stores; List<PaymentMethodDto> get payments; bool get homeSetupEligible; List<HomeSetupSlotDayDto> get homeSetupDays; CheckoutPointsDto get points; List<SummaryRowDto> get summary; Money get subtotal; Money get deliveryFee; Money get total; bool get canPlace;@JsonKey(fromJson: checkoutProblemsFromJson) List<String> get problems; FreshnessDto? get freshness;
/// Create a copy of CheckoutDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutDtoCopyWith<CheckoutDto> get copyWith => _$CheckoutDtoCopyWithImpl<CheckoutDto>(this as CheckoutDto, _$identity);

  /// Serializes this CheckoutDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CheckoutDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutDto&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&const DeepCollectionEquality().equals(other.lines, _this.lines)&&(identical(other.itemCount, _this.itemCount) || other.itemCount == _this.itemCount)&&(identical(other.address, _this.address) || other.address == _this.address)&&const DeepCollectionEquality().equals(other.shippingOptions, _this.shippingOptions)&&const DeepCollectionEquality().equals(other.stores, _this.stores)&&const DeepCollectionEquality().equals(other.payments, _this.payments)&&(identical(other.homeSetupEligible, _this.homeSetupEligible) || other.homeSetupEligible == _this.homeSetupEligible)&&const DeepCollectionEquality().equals(other.homeSetupDays, _this.homeSetupDays)&&(identical(other.points, _this.points) || other.points == _this.points)&&const DeepCollectionEquality().equals(other.summary, _this.summary)&&(identical(other.subtotal, _this.subtotal) || other.subtotal == _this.subtotal)&&(identical(other.deliveryFee, _this.deliveryFee) || other.deliveryFee == _this.deliveryFee)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.canPlace, _this.canPlace) || other.canPlace == _this.canPlace)&&const DeepCollectionEquality().equals(other.problems, _this.problems)&&(identical(other.freshness, _this.freshness) || other.freshness == _this.freshness));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CheckoutDto;
  return Object.hash(runtimeType,_this.mode,const DeepCollectionEquality().hash(_this.lines),_this.itemCount,_this.address,const DeepCollectionEquality().hash(_this.shippingOptions),const DeepCollectionEquality().hash(_this.stores),const DeepCollectionEquality().hash(_this.payments),_this.homeSetupEligible,const DeepCollectionEquality().hash(_this.homeSetupDays),_this.points,const DeepCollectionEquality().hash(_this.summary),_this.subtotal,_this.deliveryFee,_this.total,_this.canPlace,const DeepCollectionEquality().hash(_this.problems),_this.freshness);
}

@override
String toString() {
  final _this = this as CheckoutDto;
  return 'CheckoutDto(mode: ${_this.mode}, lines: ${_this.lines}, itemCount: ${_this.itemCount}, address: ${_this.address}, shippingOptions: ${_this.shippingOptions}, stores: ${_this.stores}, payments: ${_this.payments}, homeSetupEligible: ${_this.homeSetupEligible}, homeSetupDays: ${_this.homeSetupDays}, points: ${_this.points}, summary: ${_this.summary}, subtotal: ${_this.subtotal}, deliveryFee: ${_this.deliveryFee}, total: ${_this.total}, canPlace: ${_this.canPlace}, problems: ${_this.problems}, freshness: ${_this.freshness})';
}


}

/// @nodoc
abstract mixin class $CheckoutDtoCopyWith<$Res>  {
  factory $CheckoutDtoCopyWith(CheckoutDto value, $Res Function(CheckoutDto) _then) = _$CheckoutDtoCopyWithImpl;
@useResult
$Res call({
 String mode, List<CheckoutLineDto> lines, int itemCount, AddressDto? address, List<ShippingOptionDto> shippingOptions, List<PickupStoreDto> stores, List<PaymentMethodDto> payments, bool homeSetupEligible, List<HomeSetupSlotDayDto> homeSetupDays, CheckoutPointsDto points, List<SummaryRowDto> summary, Money subtotal, Money deliveryFee, Money total, bool canPlace,@JsonKey(fromJson: checkoutProblemsFromJson) List<String> problems, FreshnessDto? freshness
});


$AddressDtoCopyWith<$Res>? get address;$CheckoutPointsDtoCopyWith<$Res> get points;$MoneyCopyWith<$Res> get subtotal;$MoneyCopyWith<$Res> get deliveryFee;$MoneyCopyWith<$Res> get total;$FreshnessDtoCopyWith<$Res>? get freshness;

}
/// @nodoc
class _$CheckoutDtoCopyWithImpl<$Res>
    implements $CheckoutDtoCopyWith<$Res> {
  _$CheckoutDtoCopyWithImpl(this._self, this._then);

  final CheckoutDto _self;
  final $Res Function(CheckoutDto) _then;

/// Create a copy of CheckoutDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? lines = null,Object? itemCount = null,Object? address = freezed,Object? shippingOptions = null,Object? stores = null,Object? payments = null,Object? homeSetupEligible = null,Object? homeSetupDays = null,Object? points = null,Object? summary = null,Object? subtotal = null,Object? deliveryFee = null,Object? total = null,Object? canPlace = null,Object? problems = null,Object? freshness = freezed,}) {
  return _then(CheckoutDto(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<CheckoutLineDto>,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressDto?,shippingOptions: null == shippingOptions ? _self.shippingOptions : shippingOptions // ignore: cast_nullable_to_non_nullable
as List<ShippingOptionDto>,stores: null == stores ? _self.stores : stores // ignore: cast_nullable_to_non_nullable
as List<PickupStoreDto>,payments: null == payments ? _self.payments : payments // ignore: cast_nullable_to_non_nullable
as List<PaymentMethodDto>,homeSetupEligible: null == homeSetupEligible ? _self.homeSetupEligible : homeSetupEligible // ignore: cast_nullable_to_non_nullable
as bool,homeSetupDays: null == homeSetupDays ? _self.homeSetupDays : homeSetupDays // ignore: cast_nullable_to_non_nullable
as List<HomeSetupSlotDayDto>,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as CheckoutPointsDto,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as List<SummaryRowDto>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as Money,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as Money,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,canPlace: null == canPlace ? _self.canPlace : canPlace // ignore: cast_nullable_to_non_nullable
as bool,problems: null == problems ? _self.problems : problems // ignore: cast_nullable_to_non_nullable
as List<String>,freshness: freezed == freshness ? _self.freshness : freshness // ignore: cast_nullable_to_non_nullable
as FreshnessDto?,
  ));
}
/// Create a copy of CheckoutDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressDtoCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $AddressDtoCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of CheckoutDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckoutPointsDtoCopyWith<$Res> get points {
  
  return $CheckoutPointsDtoCopyWith<$Res>(_self.points, (value) {
    return _then(_self.copyWith(points: value));
  });
}/// Create a copy of CheckoutDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get subtotal {
  
  return $MoneyCopyWith<$Res>(_self.subtotal, (value) {
    return _then(_self.copyWith(subtotal: value));
  });
}/// Create a copy of CheckoutDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get deliveryFee {
  
  return $MoneyCopyWith<$Res>(_self.deliveryFee, (value) {
    return _then(_self.copyWith(deliveryFee: value));
  });
}/// Create a copy of CheckoutDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get total {
  
  return $MoneyCopyWith<$Res>(_self.total, (value) {
    return _then(_self.copyWith(total: value));
  });
}/// Create a copy of CheckoutDto
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


/// Adds pattern-matching-related methods to [CheckoutDto].
extension CheckoutDtoPatterns on CheckoutDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutDto value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutDto value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String mode,  List<CheckoutLineDto> lines,  int itemCount,  AddressDto? address,  List<ShippingOptionDto> shippingOptions,  List<PickupStoreDto> stores,  List<PaymentMethodDto> payments,  bool homeSetupEligible,  List<HomeSetupSlotDayDto> homeSetupDays,  CheckoutPointsDto points,  List<SummaryRowDto> summary,  Money subtotal,  Money deliveryFee,  Money total,  bool canPlace, @JsonKey(fromJson: checkoutProblemsFromJson)  List<String> problems,  FreshnessDto? freshness)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutDto() when $default != null:
return $default(_that.mode,_that.lines,_that.itemCount,_that.address,_that.shippingOptions,_that.stores,_that.payments,_that.homeSetupEligible,_that.homeSetupDays,_that.points,_that.summary,_that.subtotal,_that.deliveryFee,_that.total,_that.canPlace,_that.problems,_that.freshness);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String mode,  List<CheckoutLineDto> lines,  int itemCount,  AddressDto? address,  List<ShippingOptionDto> shippingOptions,  List<PickupStoreDto> stores,  List<PaymentMethodDto> payments,  bool homeSetupEligible,  List<HomeSetupSlotDayDto> homeSetupDays,  CheckoutPointsDto points,  List<SummaryRowDto> summary,  Money subtotal,  Money deliveryFee,  Money total,  bool canPlace, @JsonKey(fromJson: checkoutProblemsFromJson)  List<String> problems,  FreshnessDto? freshness)  $default,) {final _that = this;
switch (_that) {
case _CheckoutDto():
return $default(_that.mode,_that.lines,_that.itemCount,_that.address,_that.shippingOptions,_that.stores,_that.payments,_that.homeSetupEligible,_that.homeSetupDays,_that.points,_that.summary,_that.subtotal,_that.deliveryFee,_that.total,_that.canPlace,_that.problems,_that.freshness);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String mode,  List<CheckoutLineDto> lines,  int itemCount,  AddressDto? address,  List<ShippingOptionDto> shippingOptions,  List<PickupStoreDto> stores,  List<PaymentMethodDto> payments,  bool homeSetupEligible,  List<HomeSetupSlotDayDto> homeSetupDays,  CheckoutPointsDto points,  List<SummaryRowDto> summary,  Money subtotal,  Money deliveryFee,  Money total,  bool canPlace, @JsonKey(fromJson: checkoutProblemsFromJson)  List<String> problems,  FreshnessDto? freshness)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutDto() when $default != null:
return $default(_that.mode,_that.lines,_that.itemCount,_that.address,_that.shippingOptions,_that.stores,_that.payments,_that.homeSetupEligible,_that.homeSetupDays,_that.points,_that.summary,_that.subtotal,_that.deliveryFee,_that.total,_that.canPlace,_that.problems,_that.freshness);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutDto implements CheckoutDto {
  const _CheckoutDto({required this.mode,  List<CheckoutLineDto> lines = const [], this.itemCount = 0, this.address,  List<ShippingOptionDto> shippingOptions = const [],  List<PickupStoreDto> stores = const [],  List<PaymentMethodDto> payments = const [], this.homeSetupEligible = false,  List<HomeSetupSlotDayDto> homeSetupDays = const [], this.points = const CheckoutPointsDto(),  List<SummaryRowDto> summary = const [], required this.subtotal, required this.deliveryFee, required this.total, this.canPlace = false, @JsonKey(fromJson: checkoutProblemsFromJson)  List<String> problems = const [], this.freshness}): _lines = lines,_shippingOptions = shippingOptions,_stores = stores,_payments = payments,_homeSetupDays = homeSetupDays,_summary = summary,_problems = problems;
  factory _CheckoutDto.fromJson(Map<String, dynamic> json) => _$CheckoutDtoFromJson(json);

@override final  String mode;
 final  List<CheckoutLineDto> _lines;
@override@JsonKey() List<CheckoutLineDto> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

@override@JsonKey() final  int itemCount;
@override final  AddressDto? address;
 final  List<ShippingOptionDto> _shippingOptions;
@override@JsonKey() List<ShippingOptionDto> get shippingOptions {
  if (_shippingOptions is EqualUnmodifiableListView) return _shippingOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shippingOptions);
}

 final  List<PickupStoreDto> _stores;
@override@JsonKey() List<PickupStoreDto> get stores {
  if (_stores is EqualUnmodifiableListView) return _stores;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stores);
}

 final  List<PaymentMethodDto> _payments;
@override@JsonKey() List<PaymentMethodDto> get payments {
  if (_payments is EqualUnmodifiableListView) return _payments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_payments);
}

@override@JsonKey() final  bool homeSetupEligible;
 final  List<HomeSetupSlotDayDto> _homeSetupDays;
@override@JsonKey() List<HomeSetupSlotDayDto> get homeSetupDays {
  if (_homeSetupDays is EqualUnmodifiableListView) return _homeSetupDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_homeSetupDays);
}

@override@JsonKey() final  CheckoutPointsDto points;
 final  List<SummaryRowDto> _summary;
@override@JsonKey() List<SummaryRowDto> get summary {
  if (_summary is EqualUnmodifiableListView) return _summary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_summary);
}

@override final  Money subtotal;
@override final  Money deliveryFee;
@override final  Money total;
@override@JsonKey() final  bool canPlace;
 final  List<String> _problems;
@override@JsonKey(fromJson: checkoutProblemsFromJson) List<String> get problems {
  if (_problems is EqualUnmodifiableListView) return _problems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_problems);
}

@override final  FreshnessDto? freshness;

/// Create a copy of CheckoutDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutDtoCopyWith<_CheckoutDto> get copyWith => __$CheckoutDtoCopyWithImpl<_CheckoutDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutDto&&(identical(other.mode, mode) || other.mode == mode)&&const DeepCollectionEquality().equals(other.lines, _lines)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.shippingOptions, _shippingOptions)&&const DeepCollectionEquality().equals(other.stores, _stores)&&const DeepCollectionEquality().equals(other.payments, _payments)&&(identical(other.homeSetupEligible, homeSetupEligible) || other.homeSetupEligible == homeSetupEligible)&&const DeepCollectionEquality().equals(other.homeSetupDays, _homeSetupDays)&&(identical(other.points, points) || other.points == points)&&const DeepCollectionEquality().equals(other.summary, _summary)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.total, total) || other.total == total)&&(identical(other.canPlace, canPlace) || other.canPlace == canPlace)&&const DeepCollectionEquality().equals(other.problems, _problems)&&(identical(other.freshness, freshness) || other.freshness == freshness));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,mode,const DeepCollectionEquality().hash(_lines),itemCount,address,const DeepCollectionEquality().hash(_shippingOptions),const DeepCollectionEquality().hash(_stores),const DeepCollectionEquality().hash(_payments),homeSetupEligible,const DeepCollectionEquality().hash(_homeSetupDays),points,const DeepCollectionEquality().hash(_summary),subtotal,deliveryFee,total,canPlace,const DeepCollectionEquality().hash(_problems),freshness);
}

@override
String toString() {
    return 'CheckoutDto(mode: $mode, lines: $lines, itemCount: $itemCount, address: $address, shippingOptions: $shippingOptions, stores: $stores, payments: $payments, homeSetupEligible: $homeSetupEligible, homeSetupDays: $homeSetupDays, points: $points, summary: $summary, subtotal: $subtotal, deliveryFee: $deliveryFee, total: $total, canPlace: $canPlace, problems: $problems, freshness: $freshness)';
}


}

/// @nodoc
abstract mixin class _$CheckoutDtoCopyWith<$Res> implements $CheckoutDtoCopyWith<$Res> {
  factory _$CheckoutDtoCopyWith(_CheckoutDto value, $Res Function(_CheckoutDto) _then) = __$CheckoutDtoCopyWithImpl;
@override @useResult
$Res call({
 String mode, List<CheckoutLineDto> lines, int itemCount, AddressDto? address, List<ShippingOptionDto> shippingOptions, List<PickupStoreDto> stores, List<PaymentMethodDto> payments, bool homeSetupEligible, List<HomeSetupSlotDayDto> homeSetupDays, CheckoutPointsDto points, List<SummaryRowDto> summary, Money subtotal, Money deliveryFee, Money total, bool canPlace,@JsonKey(fromJson: checkoutProblemsFromJson) List<String> problems, FreshnessDto? freshness
});


@override $AddressDtoCopyWith<$Res>? get address;@override $CheckoutPointsDtoCopyWith<$Res> get points;@override $MoneyCopyWith<$Res> get subtotal;@override $MoneyCopyWith<$Res> get deliveryFee;@override $MoneyCopyWith<$Res> get total;@override $FreshnessDtoCopyWith<$Res>? get freshness;

}
/// @nodoc
class __$CheckoutDtoCopyWithImpl<$Res>
    implements _$CheckoutDtoCopyWith<$Res> {
  __$CheckoutDtoCopyWithImpl(this._self, this._then);

  final _CheckoutDto _self;
  final $Res Function(_CheckoutDto) _then;

/// Create a copy of CheckoutDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? lines = null,Object? itemCount = null,Object? address = freezed,Object? shippingOptions = null,Object? stores = null,Object? payments = null,Object? homeSetupEligible = null,Object? homeSetupDays = null,Object? points = null,Object? summary = null,Object? subtotal = null,Object? deliveryFee = null,Object? total = null,Object? canPlace = null,Object? problems = null,Object? freshness = freezed,}) {
  return _then(_CheckoutDto(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<CheckoutLineDto>,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as AddressDto?,shippingOptions: null == shippingOptions ? _self._shippingOptions : shippingOptions // ignore: cast_nullable_to_non_nullable
as List<ShippingOptionDto>,stores: null == stores ? _self._stores : stores // ignore: cast_nullable_to_non_nullable
as List<PickupStoreDto>,payments: null == payments ? _self._payments : payments // ignore: cast_nullable_to_non_nullable
as List<PaymentMethodDto>,homeSetupEligible: null == homeSetupEligible ? _self.homeSetupEligible : homeSetupEligible // ignore: cast_nullable_to_non_nullable
as bool,homeSetupDays: null == homeSetupDays ? _self._homeSetupDays : homeSetupDays // ignore: cast_nullable_to_non_nullable
as List<HomeSetupSlotDayDto>,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as CheckoutPointsDto,summary: null == summary ? _self._summary : summary // ignore: cast_nullable_to_non_nullable
as List<SummaryRowDto>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as Money,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as Money,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,canPlace: null == canPlace ? _self.canPlace : canPlace // ignore: cast_nullable_to_non_nullable
as bool,problems: null == problems ? _self._problems : problems // ignore: cast_nullable_to_non_nullable
as List<String>,freshness: freezed == freshness ? _self.freshness : freshness // ignore: cast_nullable_to_non_nullable
as FreshnessDto?,
  ));
}

/// Create a copy of CheckoutDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddressDtoCopyWith<$Res>? get address {
    if (_self.address == null) {
    return null;
  }

  return $AddressDtoCopyWith<$Res>(_self.address!, (value) {
    return _then(_self.copyWith(address: value));
  });
}/// Create a copy of CheckoutDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckoutPointsDtoCopyWith<$Res> get points {
  
  return $CheckoutPointsDtoCopyWith<$Res>(_self.points, (value) {
    return _then(_self.copyWith(points: value));
  });
}/// Create a copy of CheckoutDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get subtotal {
  
  return $MoneyCopyWith<$Res>(_self.subtotal, (value) {
    return _then(_self.copyWith(subtotal: value));
  });
}/// Create a copy of CheckoutDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get deliveryFee {
  
  return $MoneyCopyWith<$Res>(_self.deliveryFee, (value) {
    return _then(_self.copyWith(deliveryFee: value));
  });
}/// Create a copy of CheckoutDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get total {
  
  return $MoneyCopyWith<$Res>(_self.total, (value) {
    return _then(_self.copyWith(total: value));
  });
}/// Create a copy of CheckoutDto
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


/// @nodoc
mixin _$OrderPlacedDto {

 String get number; String get deliveryText; String get paymentText; int get estimatedPoints; Money get total;
/// Create a copy of OrderPlacedDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderPlacedDtoCopyWith<OrderPlacedDto> get copyWith => _$OrderPlacedDtoCopyWithImpl<OrderPlacedDto>(this as OrderPlacedDto, _$identity);

  /// Serializes this OrderPlacedDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderPlacedDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderPlacedDto&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.deliveryText, _this.deliveryText) || other.deliveryText == _this.deliveryText)&&(identical(other.paymentText, _this.paymentText) || other.paymentText == _this.paymentText)&&(identical(other.estimatedPoints, _this.estimatedPoints) || other.estimatedPoints == _this.estimatedPoints)&&(identical(other.total, _this.total) || other.total == _this.total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderPlacedDto;
  return Object.hash(runtimeType,_this.number,_this.deliveryText,_this.paymentText,_this.estimatedPoints,_this.total);
}

@override
String toString() {
  final _this = this as OrderPlacedDto;
  return 'OrderPlacedDto(number: ${_this.number}, deliveryText: ${_this.deliveryText}, paymentText: ${_this.paymentText}, estimatedPoints: ${_this.estimatedPoints}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $OrderPlacedDtoCopyWith<$Res>  {
  factory $OrderPlacedDtoCopyWith(OrderPlacedDto value, $Res Function(OrderPlacedDto) _then) = _$OrderPlacedDtoCopyWithImpl;
@useResult
$Res call({
 String number, String deliveryText, String paymentText, int estimatedPoints, Money total
});


$MoneyCopyWith<$Res> get total;

}
/// @nodoc
class _$OrderPlacedDtoCopyWithImpl<$Res>
    implements $OrderPlacedDtoCopyWith<$Res> {
  _$OrderPlacedDtoCopyWithImpl(this._self, this._then);

  final OrderPlacedDto _self;
  final $Res Function(OrderPlacedDto) _then;

/// Create a copy of OrderPlacedDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? deliveryText = null,Object? paymentText = null,Object? estimatedPoints = null,Object? total = null,}) {
  return _then(OrderPlacedDto(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,deliveryText: null == deliveryText ? _self.deliveryText : deliveryText // ignore: cast_nullable_to_non_nullable
as String,paymentText: null == paymentText ? _self.paymentText : paymentText // ignore: cast_nullable_to_non_nullable
as String,estimatedPoints: null == estimatedPoints ? _self.estimatedPoints : estimatedPoints // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}
/// Create a copy of OrderPlacedDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get total {
  
  return $MoneyCopyWith<$Res>(_self.total, (value) {
    return _then(_self.copyWith(total: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderPlacedDto].
extension OrderPlacedDtoPatterns on OrderPlacedDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderPlacedDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderPlacedDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderPlacedDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderPlacedDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderPlacedDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderPlacedDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String number,  String deliveryText,  String paymentText,  int estimatedPoints,  Money total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderPlacedDto() when $default != null:
return $default(_that.number,_that.deliveryText,_that.paymentText,_that.estimatedPoints,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String number,  String deliveryText,  String paymentText,  int estimatedPoints,  Money total)  $default,) {final _that = this;
switch (_that) {
case _OrderPlacedDto():
return $default(_that.number,_that.deliveryText,_that.paymentText,_that.estimatedPoints,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String number,  String deliveryText,  String paymentText,  int estimatedPoints,  Money total)?  $default,) {final _that = this;
switch (_that) {
case _OrderPlacedDto() when $default != null:
return $default(_that.number,_that.deliveryText,_that.paymentText,_that.estimatedPoints,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderPlacedDto implements OrderPlacedDto {
  const _OrderPlacedDto({required this.number, required this.deliveryText, required this.paymentText, this.estimatedPoints = 0, required this.total});
  factory _OrderPlacedDto.fromJson(Map<String, dynamic> json) => _$OrderPlacedDtoFromJson(json);

@override final  String number;
@override final  String deliveryText;
@override final  String paymentText;
@override@JsonKey() final  int estimatedPoints;
@override final  Money total;

/// Create a copy of OrderPlacedDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderPlacedDtoCopyWith<_OrderPlacedDto> get copyWith => __$OrderPlacedDtoCopyWithImpl<_OrderPlacedDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderPlacedDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderPlacedDto&&(identical(other.number, number) || other.number == number)&&(identical(other.deliveryText, deliveryText) || other.deliveryText == deliveryText)&&(identical(other.paymentText, paymentText) || other.paymentText == paymentText)&&(identical(other.estimatedPoints, estimatedPoints) || other.estimatedPoints == estimatedPoints)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,number,deliveryText,paymentText,estimatedPoints,total);
}

@override
String toString() {
    return 'OrderPlacedDto(number: $number, deliveryText: $deliveryText, paymentText: $paymentText, estimatedPoints: $estimatedPoints, total: $total)';
}


}

/// @nodoc
abstract mixin class _$OrderPlacedDtoCopyWith<$Res> implements $OrderPlacedDtoCopyWith<$Res> {
  factory _$OrderPlacedDtoCopyWith(_OrderPlacedDto value, $Res Function(_OrderPlacedDto) _then) = __$OrderPlacedDtoCopyWithImpl;
@override @useResult
$Res call({
 String number, String deliveryText, String paymentText, int estimatedPoints, Money total
});


@override $MoneyCopyWith<$Res> get total;

}
/// @nodoc
class __$OrderPlacedDtoCopyWithImpl<$Res>
    implements _$OrderPlacedDtoCopyWith<$Res> {
  __$OrderPlacedDtoCopyWithImpl(this._self, this._then);

  final _OrderPlacedDto _self;
  final $Res Function(_OrderPlacedDto) _then;

/// Create a copy of OrderPlacedDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? deliveryText = null,Object? paymentText = null,Object? estimatedPoints = null,Object? total = null,}) {
  return _then(_OrderPlacedDto(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,deliveryText: null == deliveryText ? _self.deliveryText : deliveryText // ignore: cast_nullable_to_non_nullable
as String,paymentText: null == paymentText ? _self.paymentText : paymentText // ignore: cast_nullable_to_non_nullable
as String,estimatedPoints: null == estimatedPoints ? _self.estimatedPoints : estimatedPoints // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of OrderPlacedDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get total {
  
  return $MoneyCopyWith<$Res>(_self.total, (value) {
    return _then(_self.copyWith(total: value));
  });
}
}

// dart format on
