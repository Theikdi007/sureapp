// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderSummaryDto {

 String get number; String get placedAt; String get status; String get statusLabel;/// warning | primary | positive | critical
 String get statusColor; bool get fulfilled; String get title; String? get imageUrl; int get itemCount; Money get total; bool get express; bool get hasHomeSetup; String get meta;
/// Create a copy of OrderSummaryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderSummaryDtoCopyWith<OrderSummaryDto> get copyWith => _$OrderSummaryDtoCopyWithImpl<OrderSummaryDto>(this as OrderSummaryDto, _$identity);

  /// Serializes this OrderSummaryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderSummaryDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderSummaryDto&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.placedAt, _this.placedAt) || other.placedAt == _this.placedAt)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.statusLabel, _this.statusLabel) || other.statusLabel == _this.statusLabel)&&(identical(other.statusColor, _this.statusColor) || other.statusColor == _this.statusColor)&&(identical(other.fulfilled, _this.fulfilled) || other.fulfilled == _this.fulfilled)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.itemCount, _this.itemCount) || other.itemCount == _this.itemCount)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.express, _this.express) || other.express == _this.express)&&(identical(other.hasHomeSetup, _this.hasHomeSetup) || other.hasHomeSetup == _this.hasHomeSetup)&&(identical(other.meta, _this.meta) || other.meta == _this.meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderSummaryDto;
  return Object.hash(runtimeType,_this.number,_this.placedAt,_this.status,_this.statusLabel,_this.statusColor,_this.fulfilled,_this.title,_this.imageUrl,_this.itemCount,_this.total,_this.express,_this.hasHomeSetup,_this.meta);
}

@override
String toString() {
  final _this = this as OrderSummaryDto;
  return 'OrderSummaryDto(number: ${_this.number}, placedAt: ${_this.placedAt}, status: ${_this.status}, statusLabel: ${_this.statusLabel}, statusColor: ${_this.statusColor}, fulfilled: ${_this.fulfilled}, title: ${_this.title}, imageUrl: ${_this.imageUrl}, itemCount: ${_this.itemCount}, total: ${_this.total}, express: ${_this.express}, hasHomeSetup: ${_this.hasHomeSetup}, meta: ${_this.meta})';
}


}

/// @nodoc
abstract mixin class $OrderSummaryDtoCopyWith<$Res>  {
  factory $OrderSummaryDtoCopyWith(OrderSummaryDto value, $Res Function(OrderSummaryDto) _then) = _$OrderSummaryDtoCopyWithImpl;
@useResult
$Res call({
 String number, String placedAt, String status, String statusLabel, String statusColor, bool fulfilled, String title, String? imageUrl, int itemCount, Money total, bool express, bool hasHomeSetup, String meta
});


$MoneyCopyWith<$Res> get total;

}
/// @nodoc
class _$OrderSummaryDtoCopyWithImpl<$Res>
    implements $OrderSummaryDtoCopyWith<$Res> {
  _$OrderSummaryDtoCopyWithImpl(this._self, this._then);

  final OrderSummaryDto _self;
  final $Res Function(OrderSummaryDto) _then;

/// Create a copy of OrderSummaryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? placedAt = null,Object? status = null,Object? statusLabel = null,Object? statusColor = null,Object? fulfilled = null,Object? title = null,Object? imageUrl = freezed,Object? itemCount = null,Object? total = null,Object? express = null,Object? hasHomeSetup = null,Object? meta = null,}) {
  return _then(OrderSummaryDto(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,statusColor: null == statusColor ? _self.statusColor : statusColor // ignore: cast_nullable_to_non_nullable
as String,fulfilled: null == fulfilled ? _self.fulfilled : fulfilled // ignore: cast_nullable_to_non_nullable
as bool,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,express: null == express ? _self.express : express // ignore: cast_nullable_to_non_nullable
as bool,hasHomeSetup: null == hasHomeSetup ? _self.hasHomeSetup : hasHomeSetup // ignore: cast_nullable_to_non_nullable
as bool,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of OrderSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get total {
  
  return $MoneyCopyWith<$Res>(_self.total, (value) {
    return _then(_self.copyWith(total: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderSummaryDto].
extension OrderSummaryDtoPatterns on OrderSummaryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderSummaryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderSummaryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderSummaryDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderSummaryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderSummaryDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderSummaryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String number,  String placedAt,  String status,  String statusLabel,  String statusColor,  bool fulfilled,  String title,  String? imageUrl,  int itemCount,  Money total,  bool express,  bool hasHomeSetup,  String meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderSummaryDto() when $default != null:
return $default(_that.number,_that.placedAt,_that.status,_that.statusLabel,_that.statusColor,_that.fulfilled,_that.title,_that.imageUrl,_that.itemCount,_that.total,_that.express,_that.hasHomeSetup,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String number,  String placedAt,  String status,  String statusLabel,  String statusColor,  bool fulfilled,  String title,  String? imageUrl,  int itemCount,  Money total,  bool express,  bool hasHomeSetup,  String meta)  $default,) {final _that = this;
switch (_that) {
case _OrderSummaryDto():
return $default(_that.number,_that.placedAt,_that.status,_that.statusLabel,_that.statusColor,_that.fulfilled,_that.title,_that.imageUrl,_that.itemCount,_that.total,_that.express,_that.hasHomeSetup,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String number,  String placedAt,  String status,  String statusLabel,  String statusColor,  bool fulfilled,  String title,  String? imageUrl,  int itemCount,  Money total,  bool express,  bool hasHomeSetup,  String meta)?  $default,) {final _that = this;
switch (_that) {
case _OrderSummaryDto() when $default != null:
return $default(_that.number,_that.placedAt,_that.status,_that.statusLabel,_that.statusColor,_that.fulfilled,_that.title,_that.imageUrl,_that.itemCount,_that.total,_that.express,_that.hasHomeSetup,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderSummaryDto implements OrderSummaryDto {
  const _OrderSummaryDto({required this.number, required this.placedAt, required this.status, required this.statusLabel, this.statusColor = 'primary', this.fulfilled = false, required this.title, this.imageUrl, this.itemCount = 1, required this.total, this.express = false, this.hasHomeSetup = false, this.meta = ''});
  factory _OrderSummaryDto.fromJson(Map<String, dynamic> json) => _$OrderSummaryDtoFromJson(json);

@override final  String number;
@override final  String placedAt;
@override final  String status;
@override final  String statusLabel;
/// warning | primary | positive | critical
@override@JsonKey() final  String statusColor;
@override@JsonKey() final  bool fulfilled;
@override final  String title;
@override final  String? imageUrl;
@override@JsonKey() final  int itemCount;
@override final  Money total;
@override@JsonKey() final  bool express;
@override@JsonKey() final  bool hasHomeSetup;
@override@JsonKey() final  String meta;

/// Create a copy of OrderSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderSummaryDtoCopyWith<_OrderSummaryDto> get copyWith => __$OrderSummaryDtoCopyWithImpl<_OrderSummaryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderSummaryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderSummaryDto&&(identical(other.number, number) || other.number == number)&&(identical(other.placedAt, placedAt) || other.placedAt == placedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.statusColor, statusColor) || other.statusColor == statusColor)&&(identical(other.fulfilled, fulfilled) || other.fulfilled == fulfilled)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.total, total) || other.total == total)&&(identical(other.express, express) || other.express == express)&&(identical(other.hasHomeSetup, hasHomeSetup) || other.hasHomeSetup == hasHomeSetup)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,number,placedAt,status,statusLabel,statusColor,fulfilled,title,imageUrl,itemCount,total,express,hasHomeSetup,meta);
}

@override
String toString() {
    return 'OrderSummaryDto(number: $number, placedAt: $placedAt, status: $status, statusLabel: $statusLabel, statusColor: $statusColor, fulfilled: $fulfilled, title: $title, imageUrl: $imageUrl, itemCount: $itemCount, total: $total, express: $express, hasHomeSetup: $hasHomeSetup, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$OrderSummaryDtoCopyWith<$Res> implements $OrderSummaryDtoCopyWith<$Res> {
  factory _$OrderSummaryDtoCopyWith(_OrderSummaryDto value, $Res Function(_OrderSummaryDto) _then) = __$OrderSummaryDtoCopyWithImpl;
@override @useResult
$Res call({
 String number, String placedAt, String status, String statusLabel, String statusColor, bool fulfilled, String title, String? imageUrl, int itemCount, Money total, bool express, bool hasHomeSetup, String meta
});


@override $MoneyCopyWith<$Res> get total;

}
/// @nodoc
class __$OrderSummaryDtoCopyWithImpl<$Res>
    implements _$OrderSummaryDtoCopyWith<$Res> {
  __$OrderSummaryDtoCopyWithImpl(this._self, this._then);

  final _OrderSummaryDto _self;
  final $Res Function(_OrderSummaryDto) _then;

/// Create a copy of OrderSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? placedAt = null,Object? status = null,Object? statusLabel = null,Object? statusColor = null,Object? fulfilled = null,Object? title = null,Object? imageUrl = freezed,Object? itemCount = null,Object? total = null,Object? express = null,Object? hasHomeSetup = null,Object? meta = null,}) {
  return _then(_OrderSummaryDto(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,statusColor: null == statusColor ? _self.statusColor : statusColor // ignore: cast_nullable_to_non_nullable
as String,fulfilled: null == fulfilled ? _self.fulfilled : fulfilled // ignore: cast_nullable_to_non_nullable
as bool,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,express: null == express ? _self.express : express // ignore: cast_nullable_to_non_nullable
as bool,hasHomeSetup: null == hasHomeSetup ? _self.hasHomeSetup : hasHomeSetup // ignore: cast_nullable_to_non_nullable
as bool,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of OrderSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get total {
  
  return $MoneyCopyWith<$Res>(_self.total, (value) {
    return _then(_self.copyWith(total: value));
  });
}
}


/// @nodoc
mixin _$OrderLineDto {

 String get sku; String get title; String? get spec; String? get imageUrl; num get qty; Money get unitPrice; Money get lineTotal;
/// Create a copy of OrderLineDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderLineDtoCopyWith<OrderLineDto> get copyWith => _$OrderLineDtoCopyWithImpl<OrderLineDto>(this as OrderLineDto, _$identity);

  /// Serializes this OrderLineDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderLineDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderLineDto&&(identical(other.sku, _this.sku) || other.sku == _this.sku)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.spec, _this.spec) || other.spec == _this.spec)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.qty, _this.qty) || other.qty == _this.qty)&&(identical(other.unitPrice, _this.unitPrice) || other.unitPrice == _this.unitPrice)&&(identical(other.lineTotal, _this.lineTotal) || other.lineTotal == _this.lineTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderLineDto;
  return Object.hash(runtimeType,_this.sku,_this.title,_this.spec,_this.imageUrl,_this.qty,_this.unitPrice,_this.lineTotal);
}

@override
String toString() {
  final _this = this as OrderLineDto;
  return 'OrderLineDto(sku: ${_this.sku}, title: ${_this.title}, spec: ${_this.spec}, imageUrl: ${_this.imageUrl}, qty: ${_this.qty}, unitPrice: ${_this.unitPrice}, lineTotal: ${_this.lineTotal})';
}


}

/// @nodoc
abstract mixin class $OrderLineDtoCopyWith<$Res>  {
  factory $OrderLineDtoCopyWith(OrderLineDto value, $Res Function(OrderLineDto) _then) = _$OrderLineDtoCopyWithImpl;
@useResult
$Res call({
 String sku, String title, String? spec, String? imageUrl, num qty, Money unitPrice, Money lineTotal
});


$MoneyCopyWith<$Res> get unitPrice;$MoneyCopyWith<$Res> get lineTotal;

}
/// @nodoc
class _$OrderLineDtoCopyWithImpl<$Res>
    implements $OrderLineDtoCopyWith<$Res> {
  _$OrderLineDtoCopyWithImpl(this._self, this._then);

  final OrderLineDto _self;
  final $Res Function(OrderLineDto) _then;

/// Create a copy of OrderLineDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sku = null,Object? title = null,Object? spec = freezed,Object? imageUrl = freezed,Object? qty = null,Object? unitPrice = null,Object? lineTotal = null,}) {
  return _then(OrderLineDto(
sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,spec: freezed == spec ? _self.spec : spec // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as num,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as Money,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}
/// Create a copy of OrderLineDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get unitPrice {
  
  return $MoneyCopyWith<$Res>(_self.unitPrice, (value) {
    return _then(_self.copyWith(unitPrice: value));
  });
}/// Create a copy of OrderLineDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get lineTotal {
  
  return $MoneyCopyWith<$Res>(_self.lineTotal, (value) {
    return _then(_self.copyWith(lineTotal: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderLineDto].
extension OrderLineDtoPatterns on OrderLineDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderLineDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderLineDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderLineDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderLineDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderLineDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderLineDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sku,  String title,  String? spec,  String? imageUrl,  num qty,  Money unitPrice,  Money lineTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderLineDto() when $default != null:
return $default(_that.sku,_that.title,_that.spec,_that.imageUrl,_that.qty,_that.unitPrice,_that.lineTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sku,  String title,  String? spec,  String? imageUrl,  num qty,  Money unitPrice,  Money lineTotal)  $default,) {final _that = this;
switch (_that) {
case _OrderLineDto():
return $default(_that.sku,_that.title,_that.spec,_that.imageUrl,_that.qty,_that.unitPrice,_that.lineTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sku,  String title,  String? spec,  String? imageUrl,  num qty,  Money unitPrice,  Money lineTotal)?  $default,) {final _that = this;
switch (_that) {
case _OrderLineDto() when $default != null:
return $default(_that.sku,_that.title,_that.spec,_that.imageUrl,_that.qty,_that.unitPrice,_that.lineTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderLineDto implements OrderLineDto {
  const _OrderLineDto({required this.sku, required this.title, this.spec, this.imageUrl, required this.qty, required this.unitPrice, required this.lineTotal});
  factory _OrderLineDto.fromJson(Map<String, dynamic> json) => _$OrderLineDtoFromJson(json);

@override final  String sku;
@override final  String title;
@override final  String? spec;
@override final  String? imageUrl;
@override final  num qty;
@override final  Money unitPrice;
@override final  Money lineTotal;

/// Create a copy of OrderLineDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderLineDtoCopyWith<_OrderLineDto> get copyWith => __$OrderLineDtoCopyWithImpl<_OrderLineDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderLineDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderLineDto&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.title, title) || other.title == title)&&(identical(other.spec, spec) || other.spec == spec)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,sku,title,spec,imageUrl,qty,unitPrice,lineTotal);
}

@override
String toString() {
    return 'OrderLineDto(sku: $sku, title: $title, spec: $spec, imageUrl: $imageUrl, qty: $qty, unitPrice: $unitPrice, lineTotal: $lineTotal)';
}


}

/// @nodoc
abstract mixin class _$OrderLineDtoCopyWith<$Res> implements $OrderLineDtoCopyWith<$Res> {
  factory _$OrderLineDtoCopyWith(_OrderLineDto value, $Res Function(_OrderLineDto) _then) = __$OrderLineDtoCopyWithImpl;
@override @useResult
$Res call({
 String sku, String title, String? spec, String? imageUrl, num qty, Money unitPrice, Money lineTotal
});


@override $MoneyCopyWith<$Res> get unitPrice;@override $MoneyCopyWith<$Res> get lineTotal;

}
/// @nodoc
class __$OrderLineDtoCopyWithImpl<$Res>
    implements _$OrderLineDtoCopyWith<$Res> {
  __$OrderLineDtoCopyWithImpl(this._self, this._then);

  final _OrderLineDto _self;
  final $Res Function(_OrderLineDto) _then;

/// Create a copy of OrderLineDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sku = null,Object? title = null,Object? spec = freezed,Object? imageUrl = freezed,Object? qty = null,Object? unitPrice = null,Object? lineTotal = null,}) {
  return _then(_OrderLineDto(
sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,spec: freezed == spec ? _self.spec : spec // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as num,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as Money,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of OrderLineDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get unitPrice {
  
  return $MoneyCopyWith<$Res>(_self.unitPrice, (value) {
    return _then(_self.copyWith(unitPrice: value));
  });
}/// Create a copy of OrderLineDto
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
mixin _$OrderStepDto {

 String get label; String? get description; String? get at; bool get done; bool get current;
/// Create a copy of OrderStepDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderStepDtoCopyWith<OrderStepDto> get copyWith => _$OrderStepDtoCopyWithImpl<OrderStepDto>(this as OrderStepDto, _$identity);

  /// Serializes this OrderStepDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderStepDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderStepDto&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.done, _this.done) || other.done == _this.done)&&(identical(other.current, _this.current) || other.current == _this.current));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderStepDto;
  return Object.hash(runtimeType,_this.label,_this.description,_this.at,_this.done,_this.current);
}

@override
String toString() {
  final _this = this as OrderStepDto;
  return 'OrderStepDto(label: ${_this.label}, description: ${_this.description}, at: ${_this.at}, done: ${_this.done}, current: ${_this.current})';
}


}

/// @nodoc
abstract mixin class $OrderStepDtoCopyWith<$Res>  {
  factory $OrderStepDtoCopyWith(OrderStepDto value, $Res Function(OrderStepDto) _then) = _$OrderStepDtoCopyWithImpl;
@useResult
$Res call({
 String label, String? description, String? at, bool done, bool current
});




}
/// @nodoc
class _$OrderStepDtoCopyWithImpl<$Res>
    implements $OrderStepDtoCopyWith<$Res> {
  _$OrderStepDtoCopyWithImpl(this._self, this._then);

  final OrderStepDto _self;
  final $Res Function(OrderStepDto) _then;

/// Create a copy of OrderStepDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? description = freezed,Object? at = freezed,Object? done = null,Object? current = null,}) {
  return _then(OrderStepDto(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,at: freezed == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String?,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool,current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderStepDto].
extension OrderStepDtoPatterns on OrderStepDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderStepDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderStepDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderStepDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderStepDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderStepDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderStepDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String? description,  String? at,  bool done,  bool current)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderStepDto() when $default != null:
return $default(_that.label,_that.description,_that.at,_that.done,_that.current);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String? description,  String? at,  bool done,  bool current)  $default,) {final _that = this;
switch (_that) {
case _OrderStepDto():
return $default(_that.label,_that.description,_that.at,_that.done,_that.current);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String? description,  String? at,  bool done,  bool current)?  $default,) {final _that = this;
switch (_that) {
case _OrderStepDto() when $default != null:
return $default(_that.label,_that.description,_that.at,_that.done,_that.current);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderStepDto implements OrderStepDto {
  const _OrderStepDto({required this.label, this.description, this.at, this.done = false, this.current = false});
  factory _OrderStepDto.fromJson(Map<String, dynamic> json) => _$OrderStepDtoFromJson(json);

@override final  String label;
@override final  String? description;
@override final  String? at;
@override@JsonKey() final  bool done;
@override@JsonKey() final  bool current;

/// Create a copy of OrderStepDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderStepDtoCopyWith<_OrderStepDto> get copyWith => __$OrderStepDtoCopyWithImpl<_OrderStepDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderStepDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderStepDto&&(identical(other.label, label) || other.label == label)&&(identical(other.description, description) || other.description == description)&&(identical(other.at, at) || other.at == at)&&(identical(other.done, done) || other.done == done)&&(identical(other.current, current) || other.current == current));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,label,description,at,done,current);
}

@override
String toString() {
    return 'OrderStepDto(label: $label, description: $description, at: $at, done: $done, current: $current)';
}


}

/// @nodoc
abstract mixin class _$OrderStepDtoCopyWith<$Res> implements $OrderStepDtoCopyWith<$Res> {
  factory _$OrderStepDtoCopyWith(_OrderStepDto value, $Res Function(_OrderStepDto) _then) = __$OrderStepDtoCopyWithImpl;
@override @useResult
$Res call({
 String label, String? description, String? at, bool done, bool current
});




}
/// @nodoc
class __$OrderStepDtoCopyWithImpl<$Res>
    implements _$OrderStepDtoCopyWith<$Res> {
  __$OrderStepDtoCopyWithImpl(this._self, this._then);

  final _OrderStepDto _self;
  final $Res Function(_OrderStepDto) _then;

/// Create a copy of OrderStepDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? description = freezed,Object? at = freezed,Object? done = null,Object? current = null,}) {
  return _then(_OrderStepDto(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,at: freezed == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String?,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool,current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$HomeSetupBookingDto {

 String get number; String get device; String get date; String get slot; String get slotLabel; String get status; String get statusLabel; String? get orderNumber; String? get addressText; bool get canCancel;
/// Create a copy of HomeSetupBookingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeSetupBookingDtoCopyWith<HomeSetupBookingDto> get copyWith => _$HomeSetupBookingDtoCopyWithImpl<HomeSetupBookingDto>(this as HomeSetupBookingDto, _$identity);

  /// Serializes this HomeSetupBookingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HomeSetupBookingDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeSetupBookingDto&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.device, _this.device) || other.device == _this.device)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.slot, _this.slot) || other.slot == _this.slot)&&(identical(other.slotLabel, _this.slotLabel) || other.slotLabel == _this.slotLabel)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.statusLabel, _this.statusLabel) || other.statusLabel == _this.statusLabel)&&(identical(other.orderNumber, _this.orderNumber) || other.orderNumber == _this.orderNumber)&&(identical(other.addressText, _this.addressText) || other.addressText == _this.addressText)&&(identical(other.canCancel, _this.canCancel) || other.canCancel == _this.canCancel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HomeSetupBookingDto;
  return Object.hash(runtimeType,_this.number,_this.device,_this.date,_this.slot,_this.slotLabel,_this.status,_this.statusLabel,_this.orderNumber,_this.addressText,_this.canCancel);
}

@override
String toString() {
  final _this = this as HomeSetupBookingDto;
  return 'HomeSetupBookingDto(number: ${_this.number}, device: ${_this.device}, date: ${_this.date}, slot: ${_this.slot}, slotLabel: ${_this.slotLabel}, status: ${_this.status}, statusLabel: ${_this.statusLabel}, orderNumber: ${_this.orderNumber}, addressText: ${_this.addressText}, canCancel: ${_this.canCancel})';
}


}

/// @nodoc
abstract mixin class $HomeSetupBookingDtoCopyWith<$Res>  {
  factory $HomeSetupBookingDtoCopyWith(HomeSetupBookingDto value, $Res Function(HomeSetupBookingDto) _then) = _$HomeSetupBookingDtoCopyWithImpl;
@useResult
$Res call({
 String number, String device, String date, String slot, String slotLabel, String status, String statusLabel, String? orderNumber, String? addressText, bool canCancel
});




}
/// @nodoc
class _$HomeSetupBookingDtoCopyWithImpl<$Res>
    implements $HomeSetupBookingDtoCopyWith<$Res> {
  _$HomeSetupBookingDtoCopyWithImpl(this._self, this._then);

  final HomeSetupBookingDto _self;
  final $Res Function(HomeSetupBookingDto) _then;

/// Create a copy of HomeSetupBookingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? device = null,Object? date = null,Object? slot = null,Object? slotLabel = null,Object? status = null,Object? statusLabel = null,Object? orderNumber = freezed,Object? addressText = freezed,Object? canCancel = null,}) {
  return _then(HomeSetupBookingDto(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as String,slotLabel: null == slotLabel ? _self.slotLabel : slotLabel // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String?,addressText: freezed == addressText ? _self.addressText : addressText // ignore: cast_nullable_to_non_nullable
as String?,canCancel: null == canCancel ? _self.canCancel : canCancel // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeSetupBookingDto].
extension HomeSetupBookingDtoPatterns on HomeSetupBookingDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeSetupBookingDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeSetupBookingDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeSetupBookingDto value)  $default,){
final _that = this;
switch (_that) {
case _HomeSetupBookingDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeSetupBookingDto value)?  $default,){
final _that = this;
switch (_that) {
case _HomeSetupBookingDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String number,  String device,  String date,  String slot,  String slotLabel,  String status,  String statusLabel,  String? orderNumber,  String? addressText,  bool canCancel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeSetupBookingDto() when $default != null:
return $default(_that.number,_that.device,_that.date,_that.slot,_that.slotLabel,_that.status,_that.statusLabel,_that.orderNumber,_that.addressText,_that.canCancel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String number,  String device,  String date,  String slot,  String slotLabel,  String status,  String statusLabel,  String? orderNumber,  String? addressText,  bool canCancel)  $default,) {final _that = this;
switch (_that) {
case _HomeSetupBookingDto():
return $default(_that.number,_that.device,_that.date,_that.slot,_that.slotLabel,_that.status,_that.statusLabel,_that.orderNumber,_that.addressText,_that.canCancel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String number,  String device,  String date,  String slot,  String slotLabel,  String status,  String statusLabel,  String? orderNumber,  String? addressText,  bool canCancel)?  $default,) {final _that = this;
switch (_that) {
case _HomeSetupBookingDto() when $default != null:
return $default(_that.number,_that.device,_that.date,_that.slot,_that.slotLabel,_that.status,_that.statusLabel,_that.orderNumber,_that.addressText,_that.canCancel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeSetupBookingDto implements HomeSetupBookingDto {
  const _HomeSetupBookingDto({required this.number, required this.device, required this.date, required this.slot, required this.slotLabel, required this.status, required this.statusLabel, this.orderNumber, this.addressText, this.canCancel = false});
  factory _HomeSetupBookingDto.fromJson(Map<String, dynamic> json) => _$HomeSetupBookingDtoFromJson(json);

@override final  String number;
@override final  String device;
@override final  String date;
@override final  String slot;
@override final  String slotLabel;
@override final  String status;
@override final  String statusLabel;
@override final  String? orderNumber;
@override final  String? addressText;
@override@JsonKey() final  bool canCancel;

/// Create a copy of HomeSetupBookingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeSetupBookingDtoCopyWith<_HomeSetupBookingDto> get copyWith => __$HomeSetupBookingDtoCopyWithImpl<_HomeSetupBookingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeSetupBookingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeSetupBookingDto&&(identical(other.number, number) || other.number == number)&&(identical(other.device, device) || other.device == device)&&(identical(other.date, date) || other.date == date)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.slotLabel, slotLabel) || other.slotLabel == slotLabel)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.addressText, addressText) || other.addressText == addressText)&&(identical(other.canCancel, canCancel) || other.canCancel == canCancel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,number,device,date,slot,slotLabel,status,statusLabel,orderNumber,addressText,canCancel);
}

@override
String toString() {
    return 'HomeSetupBookingDto(number: $number, device: $device, date: $date, slot: $slot, slotLabel: $slotLabel, status: $status, statusLabel: $statusLabel, orderNumber: $orderNumber, addressText: $addressText, canCancel: $canCancel)';
}


}

/// @nodoc
abstract mixin class _$HomeSetupBookingDtoCopyWith<$Res> implements $HomeSetupBookingDtoCopyWith<$Res> {
  factory _$HomeSetupBookingDtoCopyWith(_HomeSetupBookingDto value, $Res Function(_HomeSetupBookingDto) _then) = __$HomeSetupBookingDtoCopyWithImpl;
@override @useResult
$Res call({
 String number, String device, String date, String slot, String slotLabel, String status, String statusLabel, String? orderNumber, String? addressText, bool canCancel
});




}
/// @nodoc
class __$HomeSetupBookingDtoCopyWithImpl<$Res>
    implements _$HomeSetupBookingDtoCopyWith<$Res> {
  __$HomeSetupBookingDtoCopyWithImpl(this._self, this._then);

  final _HomeSetupBookingDto _self;
  final $Res Function(_HomeSetupBookingDto) _then;

/// Create a copy of HomeSetupBookingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? device = null,Object? date = null,Object? slot = null,Object? slotLabel = null,Object? status = null,Object? statusLabel = null,Object? orderNumber = freezed,Object? addressText = freezed,Object? canCancel = null,}) {
  return _then(_HomeSetupBookingDto(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as String,slotLabel: null == slotLabel ? _self.slotLabel : slotLabel // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String?,addressText: freezed == addressText ? _self.addressText : addressText // ignore: cast_nullable_to_non_nullable
as String?,canCancel: null == canCancel ? _self.canCancel : canCancel // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$OrderDetailDto {

 String get number; String get placedAt; String get status; String get statusLabel; String get statusColor; bool get fulfilled; bool get open;/// delivery | pickup
 String get method; String get paymentText; String get paymentStatus; String get fulfillmentStatus; List<OrderLineDto> get lines; List<OrderStepDto> get steps; List<SummaryRowDto> get summary; Money get total; String? get shipToText; String? get pickupStore; String? get trackingText; bool get express; String? get etaText; HomeSetupBookingDto? get homeSetup; bool get canRate; bool get rated;
/// Create a copy of OrderDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDetailDtoCopyWith<OrderDetailDto> get copyWith => _$OrderDetailDtoCopyWithImpl<OrderDetailDto>(this as OrderDetailDto, _$identity);

  /// Serializes this OrderDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OrderDetailDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailDto&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.placedAt, _this.placedAt) || other.placedAt == _this.placedAt)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.statusLabel, _this.statusLabel) || other.statusLabel == _this.statusLabel)&&(identical(other.statusColor, _this.statusColor) || other.statusColor == _this.statusColor)&&(identical(other.fulfilled, _this.fulfilled) || other.fulfilled == _this.fulfilled)&&(identical(other.open, _this.open) || other.open == _this.open)&&(identical(other.method, _this.method) || other.method == _this.method)&&(identical(other.paymentText, _this.paymentText) || other.paymentText == _this.paymentText)&&(identical(other.paymentStatus, _this.paymentStatus) || other.paymentStatus == _this.paymentStatus)&&(identical(other.fulfillmentStatus, _this.fulfillmentStatus) || other.fulfillmentStatus == _this.fulfillmentStatus)&&const DeepCollectionEquality().equals(other.lines, _this.lines)&&const DeepCollectionEquality().equals(other.steps, _this.steps)&&const DeepCollectionEquality().equals(other.summary, _this.summary)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.shipToText, _this.shipToText) || other.shipToText == _this.shipToText)&&(identical(other.pickupStore, _this.pickupStore) || other.pickupStore == _this.pickupStore)&&(identical(other.trackingText, _this.trackingText) || other.trackingText == _this.trackingText)&&(identical(other.express, _this.express) || other.express == _this.express)&&(identical(other.etaText, _this.etaText) || other.etaText == _this.etaText)&&(identical(other.homeSetup, _this.homeSetup) || other.homeSetup == _this.homeSetup)&&(identical(other.canRate, _this.canRate) || other.canRate == _this.canRate)&&(identical(other.rated, _this.rated) || other.rated == _this.rated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OrderDetailDto;
  return Object.hashAll([runtimeType,_this.number,_this.placedAt,_this.status,_this.statusLabel,_this.statusColor,_this.fulfilled,_this.open,_this.method,_this.paymentText,_this.paymentStatus,_this.fulfillmentStatus,const DeepCollectionEquality().hash(_this.lines),const DeepCollectionEquality().hash(_this.steps),const DeepCollectionEquality().hash(_this.summary),_this.total,_this.shipToText,_this.pickupStore,_this.trackingText,_this.express,_this.etaText,_this.homeSetup,_this.canRate,_this.rated]);
}

@override
String toString() {
  final _this = this as OrderDetailDto;
  return 'OrderDetailDto(number: ${_this.number}, placedAt: ${_this.placedAt}, status: ${_this.status}, statusLabel: ${_this.statusLabel}, statusColor: ${_this.statusColor}, fulfilled: ${_this.fulfilled}, open: ${_this.open}, method: ${_this.method}, paymentText: ${_this.paymentText}, paymentStatus: ${_this.paymentStatus}, fulfillmentStatus: ${_this.fulfillmentStatus}, lines: ${_this.lines}, steps: ${_this.steps}, summary: ${_this.summary}, total: ${_this.total}, shipToText: ${_this.shipToText}, pickupStore: ${_this.pickupStore}, trackingText: ${_this.trackingText}, express: ${_this.express}, etaText: ${_this.etaText}, homeSetup: ${_this.homeSetup}, canRate: ${_this.canRate}, rated: ${_this.rated})';
}


}

/// @nodoc
abstract mixin class $OrderDetailDtoCopyWith<$Res>  {
  factory $OrderDetailDtoCopyWith(OrderDetailDto value, $Res Function(OrderDetailDto) _then) = _$OrderDetailDtoCopyWithImpl;
@useResult
$Res call({
 String number, String placedAt, String status, String statusLabel, String statusColor, bool fulfilled, bool open, String method, String paymentText, String paymentStatus, String fulfillmentStatus, List<OrderLineDto> lines, List<OrderStepDto> steps, List<SummaryRowDto> summary, Money total, String? shipToText, String? pickupStore, String? trackingText, bool express, String? etaText, HomeSetupBookingDto? homeSetup, bool canRate, bool rated
});


$MoneyCopyWith<$Res> get total;$HomeSetupBookingDtoCopyWith<$Res>? get homeSetup;

}
/// @nodoc
class _$OrderDetailDtoCopyWithImpl<$Res>
    implements $OrderDetailDtoCopyWith<$Res> {
  _$OrderDetailDtoCopyWithImpl(this._self, this._then);

  final OrderDetailDto _self;
  final $Res Function(OrderDetailDto) _then;

/// Create a copy of OrderDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? placedAt = null,Object? status = null,Object? statusLabel = null,Object? statusColor = null,Object? fulfilled = null,Object? open = null,Object? method = null,Object? paymentText = null,Object? paymentStatus = null,Object? fulfillmentStatus = null,Object? lines = null,Object? steps = null,Object? summary = null,Object? total = null,Object? shipToText = freezed,Object? pickupStore = freezed,Object? trackingText = freezed,Object? express = null,Object? etaText = freezed,Object? homeSetup = freezed,Object? canRate = null,Object? rated = null,}) {
  return _then(OrderDetailDto(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,statusColor: null == statusColor ? _self.statusColor : statusColor // ignore: cast_nullable_to_non_nullable
as String,fulfilled: null == fulfilled ? _self.fulfilled : fulfilled // ignore: cast_nullable_to_non_nullable
as bool,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as bool,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,paymentText: null == paymentText ? _self.paymentText : paymentText // ignore: cast_nullable_to_non_nullable
as String,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,fulfillmentStatus: null == fulfillmentStatus ? _self.fulfillmentStatus : fulfillmentStatus // ignore: cast_nullable_to_non_nullable
as String,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<OrderLineDto>,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<OrderStepDto>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as List<SummaryRowDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,shipToText: freezed == shipToText ? _self.shipToText : shipToText // ignore: cast_nullable_to_non_nullable
as String?,pickupStore: freezed == pickupStore ? _self.pickupStore : pickupStore // ignore: cast_nullable_to_non_nullable
as String?,trackingText: freezed == trackingText ? _self.trackingText : trackingText // ignore: cast_nullable_to_non_nullable
as String?,express: null == express ? _self.express : express // ignore: cast_nullable_to_non_nullable
as bool,etaText: freezed == etaText ? _self.etaText : etaText // ignore: cast_nullable_to_non_nullable
as String?,homeSetup: freezed == homeSetup ? _self.homeSetup : homeSetup // ignore: cast_nullable_to_non_nullable
as HomeSetupBookingDto?,canRate: null == canRate ? _self.canRate : canRate // ignore: cast_nullable_to_non_nullable
as bool,rated: null == rated ? _self.rated : rated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of OrderDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get total {
  
  return $MoneyCopyWith<$Res>(_self.total, (value) {
    return _then(_self.copyWith(total: value));
  });
}/// Create a copy of OrderDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeSetupBookingDtoCopyWith<$Res>? get homeSetup {
    if (_self.homeSetup == null) {
    return null;
  }

  return $HomeSetupBookingDtoCopyWith<$Res>(_self.homeSetup!, (value) {
    return _then(_self.copyWith(homeSetup: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderDetailDto].
extension OrderDetailDtoPatterns on OrderDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String number,  String placedAt,  String status,  String statusLabel,  String statusColor,  bool fulfilled,  bool open,  String method,  String paymentText,  String paymentStatus,  String fulfillmentStatus,  List<OrderLineDto> lines,  List<OrderStepDto> steps,  List<SummaryRowDto> summary,  Money total,  String? shipToText,  String? pickupStore,  String? trackingText,  bool express,  String? etaText,  HomeSetupBookingDto? homeSetup,  bool canRate,  bool rated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDetailDto() when $default != null:
return $default(_that.number,_that.placedAt,_that.status,_that.statusLabel,_that.statusColor,_that.fulfilled,_that.open,_that.method,_that.paymentText,_that.paymentStatus,_that.fulfillmentStatus,_that.lines,_that.steps,_that.summary,_that.total,_that.shipToText,_that.pickupStore,_that.trackingText,_that.express,_that.etaText,_that.homeSetup,_that.canRate,_that.rated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String number,  String placedAt,  String status,  String statusLabel,  String statusColor,  bool fulfilled,  bool open,  String method,  String paymentText,  String paymentStatus,  String fulfillmentStatus,  List<OrderLineDto> lines,  List<OrderStepDto> steps,  List<SummaryRowDto> summary,  Money total,  String? shipToText,  String? pickupStore,  String? trackingText,  bool express,  String? etaText,  HomeSetupBookingDto? homeSetup,  bool canRate,  bool rated)  $default,) {final _that = this;
switch (_that) {
case _OrderDetailDto():
return $default(_that.number,_that.placedAt,_that.status,_that.statusLabel,_that.statusColor,_that.fulfilled,_that.open,_that.method,_that.paymentText,_that.paymentStatus,_that.fulfillmentStatus,_that.lines,_that.steps,_that.summary,_that.total,_that.shipToText,_that.pickupStore,_that.trackingText,_that.express,_that.etaText,_that.homeSetup,_that.canRate,_that.rated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String number,  String placedAt,  String status,  String statusLabel,  String statusColor,  bool fulfilled,  bool open,  String method,  String paymentText,  String paymentStatus,  String fulfillmentStatus,  List<OrderLineDto> lines,  List<OrderStepDto> steps,  List<SummaryRowDto> summary,  Money total,  String? shipToText,  String? pickupStore,  String? trackingText,  bool express,  String? etaText,  HomeSetupBookingDto? homeSetup,  bool canRate,  bool rated)?  $default,) {final _that = this;
switch (_that) {
case _OrderDetailDto() when $default != null:
return $default(_that.number,_that.placedAt,_that.status,_that.statusLabel,_that.statusColor,_that.fulfilled,_that.open,_that.method,_that.paymentText,_that.paymentStatus,_that.fulfillmentStatus,_that.lines,_that.steps,_that.summary,_that.total,_that.shipToText,_that.pickupStore,_that.trackingText,_that.express,_that.etaText,_that.homeSetup,_that.canRate,_that.rated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderDetailDto implements OrderDetailDto {
  const _OrderDetailDto({required this.number, required this.placedAt, required this.status, required this.statusLabel, this.statusColor = 'primary', this.fulfilled = false, this.open = true, this.method = 'delivery', required this.paymentText, required this.paymentStatus, required this.fulfillmentStatus,  List<OrderLineDto> lines = const [],  List<OrderStepDto> steps = const [],  List<SummaryRowDto> summary = const [], required this.total, this.shipToText, this.pickupStore, this.trackingText, this.express = false, this.etaText, this.homeSetup, this.canRate = false, this.rated = false}): _lines = lines,_steps = steps,_summary = summary;
  factory _OrderDetailDto.fromJson(Map<String, dynamic> json) => _$OrderDetailDtoFromJson(json);

@override final  String number;
@override final  String placedAt;
@override final  String status;
@override final  String statusLabel;
@override@JsonKey() final  String statusColor;
@override@JsonKey() final  bool fulfilled;
@override@JsonKey() final  bool open;
/// delivery | pickup
@override@JsonKey() final  String method;
@override final  String paymentText;
@override final  String paymentStatus;
@override final  String fulfillmentStatus;
 final  List<OrderLineDto> _lines;
@override@JsonKey() List<OrderLineDto> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

 final  List<OrderStepDto> _steps;
@override@JsonKey() List<OrderStepDto> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}

 final  List<SummaryRowDto> _summary;
@override@JsonKey() List<SummaryRowDto> get summary {
  if (_summary is EqualUnmodifiableListView) return _summary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_summary);
}

@override final  Money total;
@override final  String? shipToText;
@override final  String? pickupStore;
@override final  String? trackingText;
@override@JsonKey() final  bool express;
@override final  String? etaText;
@override final  HomeSetupBookingDto? homeSetup;
@override@JsonKey() final  bool canRate;
@override@JsonKey() final  bool rated;

/// Create a copy of OrderDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDetailDtoCopyWith<_OrderDetailDto> get copyWith => __$OrderDetailDtoCopyWithImpl<_OrderDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDetailDto&&(identical(other.number, number) || other.number == number)&&(identical(other.placedAt, placedAt) || other.placedAt == placedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.statusColor, statusColor) || other.statusColor == statusColor)&&(identical(other.fulfilled, fulfilled) || other.fulfilled == fulfilled)&&(identical(other.open, open) || other.open == open)&&(identical(other.method, method) || other.method == method)&&(identical(other.paymentText, paymentText) || other.paymentText == paymentText)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.fulfillmentStatus, fulfillmentStatus) || other.fulfillmentStatus == fulfillmentStatus)&&const DeepCollectionEquality().equals(other.lines, _lines)&&const DeepCollectionEquality().equals(other.steps, _steps)&&const DeepCollectionEquality().equals(other.summary, _summary)&&(identical(other.total, total) || other.total == total)&&(identical(other.shipToText, shipToText) || other.shipToText == shipToText)&&(identical(other.pickupStore, pickupStore) || other.pickupStore == pickupStore)&&(identical(other.trackingText, trackingText) || other.trackingText == trackingText)&&(identical(other.express, express) || other.express == express)&&(identical(other.etaText, etaText) || other.etaText == etaText)&&(identical(other.homeSetup, homeSetup) || other.homeSetup == homeSetup)&&(identical(other.canRate, canRate) || other.canRate == canRate)&&(identical(other.rated, rated) || other.rated == rated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,number,placedAt,status,statusLabel,statusColor,fulfilled,open,method,paymentText,paymentStatus,fulfillmentStatus,const DeepCollectionEquality().hash(_lines),const DeepCollectionEquality().hash(_steps),const DeepCollectionEquality().hash(_summary),total,shipToText,pickupStore,trackingText,express,etaText,homeSetup,canRate,rated]);
}

@override
String toString() {
    return 'OrderDetailDto(number: $number, placedAt: $placedAt, status: $status, statusLabel: $statusLabel, statusColor: $statusColor, fulfilled: $fulfilled, open: $open, method: $method, paymentText: $paymentText, paymentStatus: $paymentStatus, fulfillmentStatus: $fulfillmentStatus, lines: $lines, steps: $steps, summary: $summary, total: $total, shipToText: $shipToText, pickupStore: $pickupStore, trackingText: $trackingText, express: $express, etaText: $etaText, homeSetup: $homeSetup, canRate: $canRate, rated: $rated)';
}


}

/// @nodoc
abstract mixin class _$OrderDetailDtoCopyWith<$Res> implements $OrderDetailDtoCopyWith<$Res> {
  factory _$OrderDetailDtoCopyWith(_OrderDetailDto value, $Res Function(_OrderDetailDto) _then) = __$OrderDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 String number, String placedAt, String status, String statusLabel, String statusColor, bool fulfilled, bool open, String method, String paymentText, String paymentStatus, String fulfillmentStatus, List<OrderLineDto> lines, List<OrderStepDto> steps, List<SummaryRowDto> summary, Money total, String? shipToText, String? pickupStore, String? trackingText, bool express, String? etaText, HomeSetupBookingDto? homeSetup, bool canRate, bool rated
});


@override $MoneyCopyWith<$Res> get total;@override $HomeSetupBookingDtoCopyWith<$Res>? get homeSetup;

}
/// @nodoc
class __$OrderDetailDtoCopyWithImpl<$Res>
    implements _$OrderDetailDtoCopyWith<$Res> {
  __$OrderDetailDtoCopyWithImpl(this._self, this._then);

  final _OrderDetailDto _self;
  final $Res Function(_OrderDetailDto) _then;

/// Create a copy of OrderDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? placedAt = null,Object? status = null,Object? statusLabel = null,Object? statusColor = null,Object? fulfilled = null,Object? open = null,Object? method = null,Object? paymentText = null,Object? paymentStatus = null,Object? fulfillmentStatus = null,Object? lines = null,Object? steps = null,Object? summary = null,Object? total = null,Object? shipToText = freezed,Object? pickupStore = freezed,Object? trackingText = freezed,Object? express = null,Object? etaText = freezed,Object? homeSetup = freezed,Object? canRate = null,Object? rated = null,}) {
  return _then(_OrderDetailDto(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,statusColor: null == statusColor ? _self.statusColor : statusColor // ignore: cast_nullable_to_non_nullable
as String,fulfilled: null == fulfilled ? _self.fulfilled : fulfilled // ignore: cast_nullable_to_non_nullable
as bool,open: null == open ? _self.open : open // ignore: cast_nullable_to_non_nullable
as bool,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,paymentText: null == paymentText ? _self.paymentText : paymentText // ignore: cast_nullable_to_non_nullable
as String,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,fulfillmentStatus: null == fulfillmentStatus ? _self.fulfillmentStatus : fulfillmentStatus // ignore: cast_nullable_to_non_nullable
as String,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<OrderLineDto>,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<OrderStepDto>,summary: null == summary ? _self._summary : summary // ignore: cast_nullable_to_non_nullable
as List<SummaryRowDto>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Money,shipToText: freezed == shipToText ? _self.shipToText : shipToText // ignore: cast_nullable_to_non_nullable
as String?,pickupStore: freezed == pickupStore ? _self.pickupStore : pickupStore // ignore: cast_nullable_to_non_nullable
as String?,trackingText: freezed == trackingText ? _self.trackingText : trackingText // ignore: cast_nullable_to_non_nullable
as String?,express: null == express ? _self.express : express // ignore: cast_nullable_to_non_nullable
as bool,etaText: freezed == etaText ? _self.etaText : etaText // ignore: cast_nullable_to_non_nullable
as String?,homeSetup: freezed == homeSetup ? _self.homeSetup : homeSetup // ignore: cast_nullable_to_non_nullable
as HomeSetupBookingDto?,canRate: null == canRate ? _self.canRate : canRate // ignore: cast_nullable_to_non_nullable
as bool,rated: null == rated ? _self.rated : rated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of OrderDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get total {
  
  return $MoneyCopyWith<$Res>(_self.total, (value) {
    return _then(_self.copyWith(total: value));
  });
}/// Create a copy of OrderDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeSetupBookingDtoCopyWith<$Res>? get homeSetup {
    if (_self.homeSetup == null) {
    return null;
  }

  return $HomeSetupBookingDtoCopyWith<$Res>(_self.homeSetup!, (value) {
    return _then(_self.copyWith(homeSetup: value));
  });
}
}


/// @nodoc
mixin _$TrackingDto {

 String get number; String get statusLabel; String? get etaText; String get mapLabel; String? get courierName; String? get courierPhone; List<OrderStepDto> get steps;
/// Create a copy of TrackingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackingDtoCopyWith<TrackingDto> get copyWith => _$TrackingDtoCopyWithImpl<TrackingDto>(this as TrackingDto, _$identity);

  /// Serializes this TrackingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TrackingDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackingDto&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.statusLabel, _this.statusLabel) || other.statusLabel == _this.statusLabel)&&(identical(other.etaText, _this.etaText) || other.etaText == _this.etaText)&&(identical(other.mapLabel, _this.mapLabel) || other.mapLabel == _this.mapLabel)&&(identical(other.courierName, _this.courierName) || other.courierName == _this.courierName)&&(identical(other.courierPhone, _this.courierPhone) || other.courierPhone == _this.courierPhone)&&const DeepCollectionEquality().equals(other.steps, _this.steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TrackingDto;
  return Object.hash(runtimeType,_this.number,_this.statusLabel,_this.etaText,_this.mapLabel,_this.courierName,_this.courierPhone,const DeepCollectionEquality().hash(_this.steps));
}

@override
String toString() {
  final _this = this as TrackingDto;
  return 'TrackingDto(number: ${_this.number}, statusLabel: ${_this.statusLabel}, etaText: ${_this.etaText}, mapLabel: ${_this.mapLabel}, courierName: ${_this.courierName}, courierPhone: ${_this.courierPhone}, steps: ${_this.steps})';
}


}

/// @nodoc
abstract mixin class $TrackingDtoCopyWith<$Res>  {
  factory $TrackingDtoCopyWith(TrackingDto value, $Res Function(TrackingDto) _then) = _$TrackingDtoCopyWithImpl;
@useResult
$Res call({
 String number, String statusLabel, String? etaText, String mapLabel, String? courierName, String? courierPhone, List<OrderStepDto> steps
});




}
/// @nodoc
class _$TrackingDtoCopyWithImpl<$Res>
    implements $TrackingDtoCopyWith<$Res> {
  _$TrackingDtoCopyWithImpl(this._self, this._then);

  final TrackingDto _self;
  final $Res Function(TrackingDto) _then;

/// Create a copy of TrackingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? statusLabel = null,Object? etaText = freezed,Object? mapLabel = null,Object? courierName = freezed,Object? courierPhone = freezed,Object? steps = null,}) {
  return _then(TrackingDto(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,etaText: freezed == etaText ? _self.etaText : etaText // ignore: cast_nullable_to_non_nullable
as String?,mapLabel: null == mapLabel ? _self.mapLabel : mapLabel // ignore: cast_nullable_to_non_nullable
as String,courierName: freezed == courierName ? _self.courierName : courierName // ignore: cast_nullable_to_non_nullable
as String?,courierPhone: freezed == courierPhone ? _self.courierPhone : courierPhone // ignore: cast_nullable_to_non_nullable
as String?,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<OrderStepDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackingDto].
extension TrackingDtoPatterns on TrackingDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackingDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackingDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackingDto value)  $default,){
final _that = this;
switch (_that) {
case _TrackingDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackingDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrackingDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String number,  String statusLabel,  String? etaText,  String mapLabel,  String? courierName,  String? courierPhone,  List<OrderStepDto> steps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackingDto() when $default != null:
return $default(_that.number,_that.statusLabel,_that.etaText,_that.mapLabel,_that.courierName,_that.courierPhone,_that.steps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String number,  String statusLabel,  String? etaText,  String mapLabel,  String? courierName,  String? courierPhone,  List<OrderStepDto> steps)  $default,) {final _that = this;
switch (_that) {
case _TrackingDto():
return $default(_that.number,_that.statusLabel,_that.etaText,_that.mapLabel,_that.courierName,_that.courierPhone,_that.steps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String number,  String statusLabel,  String? etaText,  String mapLabel,  String? courierName,  String? courierPhone,  List<OrderStepDto> steps)?  $default,) {final _that = this;
switch (_that) {
case _TrackingDto() when $default != null:
return $default(_that.number,_that.statusLabel,_that.etaText,_that.mapLabel,_that.courierName,_that.courierPhone,_that.steps);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackingDto implements TrackingDto {
  const _TrackingDto({required this.number, required this.statusLabel, this.etaText, this.mapLabel = '', this.courierName, this.courierPhone,  List<OrderStepDto> steps = const []}): _steps = steps;
  factory _TrackingDto.fromJson(Map<String, dynamic> json) => _$TrackingDtoFromJson(json);

@override final  String number;
@override final  String statusLabel;
@override final  String? etaText;
@override@JsonKey() final  String mapLabel;
@override final  String? courierName;
@override final  String? courierPhone;
 final  List<OrderStepDto> _steps;
@override@JsonKey() List<OrderStepDto> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}


/// Create a copy of TrackingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackingDtoCopyWith<_TrackingDto> get copyWith => __$TrackingDtoCopyWithImpl<_TrackingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackingDto&&(identical(other.number, number) || other.number == number)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.etaText, etaText) || other.etaText == etaText)&&(identical(other.mapLabel, mapLabel) || other.mapLabel == mapLabel)&&(identical(other.courierName, courierName) || other.courierName == courierName)&&(identical(other.courierPhone, courierPhone) || other.courierPhone == courierPhone)&&const DeepCollectionEquality().equals(other.steps, _steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,number,statusLabel,etaText,mapLabel,courierName,courierPhone,const DeepCollectionEquality().hash(_steps));
}

@override
String toString() {
    return 'TrackingDto(number: $number, statusLabel: $statusLabel, etaText: $etaText, mapLabel: $mapLabel, courierName: $courierName, courierPhone: $courierPhone, steps: $steps)';
}


}

/// @nodoc
abstract mixin class _$TrackingDtoCopyWith<$Res> implements $TrackingDtoCopyWith<$Res> {
  factory _$TrackingDtoCopyWith(_TrackingDto value, $Res Function(_TrackingDto) _then) = __$TrackingDtoCopyWithImpl;
@override @useResult
$Res call({
 String number, String statusLabel, String? etaText, String mapLabel, String? courierName, String? courierPhone, List<OrderStepDto> steps
});




}
/// @nodoc
class __$TrackingDtoCopyWithImpl<$Res>
    implements _$TrackingDtoCopyWith<$Res> {
  __$TrackingDtoCopyWithImpl(this._self, this._then);

  final _TrackingDto _self;
  final $Res Function(_TrackingDto) _then;

/// Create a copy of TrackingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? statusLabel = null,Object? etaText = freezed,Object? mapLabel = null,Object? courierName = freezed,Object? courierPhone = freezed,Object? steps = null,}) {
  return _then(_TrackingDto(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,etaText: freezed == etaText ? _self.etaText : etaText // ignore: cast_nullable_to_non_nullable
as String?,mapLabel: null == mapLabel ? _self.mapLabel : mapLabel // ignore: cast_nullable_to_non_nullable
as String,courierName: freezed == courierName ? _self.courierName : courierName // ignore: cast_nullable_to_non_nullable
as String?,courierPhone: freezed == courierPhone ? _self.courierPhone : courierPhone // ignore: cast_nullable_to_non_nullable
as String?,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<OrderStepDto>,
  ));
}


}


/// @nodoc
mixin _$BookHomeSetupRequest {

 String? get productId; String? get device; String get date; String get slot; String? get addressId; String? get orderNumber; String? get note;
/// Create a copy of BookHomeSetupRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookHomeSetupRequestCopyWith<BookHomeSetupRequest> get copyWith => _$BookHomeSetupRequestCopyWithImpl<BookHomeSetupRequest>(this as BookHomeSetupRequest, _$identity);

  /// Serializes this BookHomeSetupRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BookHomeSetupRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookHomeSetupRequest&&(identical(other.productId, _this.productId) || other.productId == _this.productId)&&(identical(other.device, _this.device) || other.device == _this.device)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.slot, _this.slot) || other.slot == _this.slot)&&(identical(other.addressId, _this.addressId) || other.addressId == _this.addressId)&&(identical(other.orderNumber, _this.orderNumber) || other.orderNumber == _this.orderNumber)&&(identical(other.note, _this.note) || other.note == _this.note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BookHomeSetupRequest;
  return Object.hash(runtimeType,_this.productId,_this.device,_this.date,_this.slot,_this.addressId,_this.orderNumber,_this.note);
}

@override
String toString() {
  final _this = this as BookHomeSetupRequest;
  return 'BookHomeSetupRequest(productId: ${_this.productId}, device: ${_this.device}, date: ${_this.date}, slot: ${_this.slot}, addressId: ${_this.addressId}, orderNumber: ${_this.orderNumber}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $BookHomeSetupRequestCopyWith<$Res>  {
  factory $BookHomeSetupRequestCopyWith(BookHomeSetupRequest value, $Res Function(BookHomeSetupRequest) _then) = _$BookHomeSetupRequestCopyWithImpl;
@useResult
$Res call({
 String? productId, String? device, String date, String slot, String? addressId, String? orderNumber, String? note
});




}
/// @nodoc
class _$BookHomeSetupRequestCopyWithImpl<$Res>
    implements $BookHomeSetupRequestCopyWith<$Res> {
  _$BookHomeSetupRequestCopyWithImpl(this._self, this._then);

  final BookHomeSetupRequest _self;
  final $Res Function(BookHomeSetupRequest) _then;

/// Create a copy of BookHomeSetupRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = freezed,Object? device = freezed,Object? date = null,Object? slot = null,Object? addressId = freezed,Object? orderNumber = freezed,Object? note = freezed,}) {
  return _then(BookHomeSetupRequest(
productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,device: freezed == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as String,addressId: freezed == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as String?,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookHomeSetupRequest].
extension BookHomeSetupRequestPatterns on BookHomeSetupRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookHomeSetupRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookHomeSetupRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookHomeSetupRequest value)  $default,){
final _that = this;
switch (_that) {
case _BookHomeSetupRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookHomeSetupRequest value)?  $default,){
final _that = this;
switch (_that) {
case _BookHomeSetupRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? productId,  String? device,  String date,  String slot,  String? addressId,  String? orderNumber,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookHomeSetupRequest() when $default != null:
return $default(_that.productId,_that.device,_that.date,_that.slot,_that.addressId,_that.orderNumber,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? productId,  String? device,  String date,  String slot,  String? addressId,  String? orderNumber,  String? note)  $default,) {final _that = this;
switch (_that) {
case _BookHomeSetupRequest():
return $default(_that.productId,_that.device,_that.date,_that.slot,_that.addressId,_that.orderNumber,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? productId,  String? device,  String date,  String slot,  String? addressId,  String? orderNumber,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _BookHomeSetupRequest() when $default != null:
return $default(_that.productId,_that.device,_that.date,_that.slot,_that.addressId,_that.orderNumber,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookHomeSetupRequest implements BookHomeSetupRequest {
  const _BookHomeSetupRequest({this.productId, this.device, required this.date, required this.slot, this.addressId, this.orderNumber, this.note});
  factory _BookHomeSetupRequest.fromJson(Map<String, dynamic> json) => _$BookHomeSetupRequestFromJson(json);

@override final  String? productId;
@override final  String? device;
@override final  String date;
@override final  String slot;
@override final  String? addressId;
@override final  String? orderNumber;
@override final  String? note;

/// Create a copy of BookHomeSetupRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookHomeSetupRequestCopyWith<_BookHomeSetupRequest> get copyWith => __$BookHomeSetupRequestCopyWithImpl<_BookHomeSetupRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookHomeSetupRequestToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookHomeSetupRequest&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.device, device) || other.device == device)&&(identical(other.date, date) || other.date == date)&&(identical(other.slot, slot) || other.slot == slot)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&(identical(other.orderNumber, orderNumber) || other.orderNumber == orderNumber)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,productId,device,date,slot,addressId,orderNumber,note);
}

@override
String toString() {
    return 'BookHomeSetupRequest(productId: $productId, device: $device, date: $date, slot: $slot, addressId: $addressId, orderNumber: $orderNumber, note: $note)';
}


}

/// @nodoc
abstract mixin class _$BookHomeSetupRequestCopyWith<$Res> implements $BookHomeSetupRequestCopyWith<$Res> {
  factory _$BookHomeSetupRequestCopyWith(_BookHomeSetupRequest value, $Res Function(_BookHomeSetupRequest) _then) = __$BookHomeSetupRequestCopyWithImpl;
@override @useResult
$Res call({
 String? productId, String? device, String date, String slot, String? addressId, String? orderNumber, String? note
});




}
/// @nodoc
class __$BookHomeSetupRequestCopyWithImpl<$Res>
    implements _$BookHomeSetupRequestCopyWith<$Res> {
  __$BookHomeSetupRequestCopyWithImpl(this._self, this._then);

  final _BookHomeSetupRequest _self;
  final $Res Function(_BookHomeSetupRequest) _then;

/// Create a copy of BookHomeSetupRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = freezed,Object? device = freezed,Object? date = null,Object? slot = null,Object? addressId = freezed,Object? orderNumber = freezed,Object? note = freezed,}) {
  return _then(_BookHomeSetupRequest(
productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,device: freezed == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as String,addressId: freezed == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as String?,orderNumber: freezed == orderNumber ? _self.orderNumber : orderNumber // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
