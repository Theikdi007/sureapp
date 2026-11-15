// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TierDto {

 String get key; String get label; int get clubScoreFrom; int? get clubScoreTo; num get earnRatePer100Ks; int? get dailyRedeemLimit; bool get current;
/// Create a copy of TierDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TierDtoCopyWith<TierDto> get copyWith => _$TierDtoCopyWithImpl<TierDto>(this as TierDto, _$identity);

  /// Serializes this TierDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TierDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TierDto&&(identical(other.key, _this.key) || other.key == _this.key)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.clubScoreFrom, _this.clubScoreFrom) || other.clubScoreFrom == _this.clubScoreFrom)&&(identical(other.clubScoreTo, _this.clubScoreTo) || other.clubScoreTo == _this.clubScoreTo)&&(identical(other.earnRatePer100Ks, _this.earnRatePer100Ks) || other.earnRatePer100Ks == _this.earnRatePer100Ks)&&(identical(other.dailyRedeemLimit, _this.dailyRedeemLimit) || other.dailyRedeemLimit == _this.dailyRedeemLimit)&&(identical(other.current, _this.current) || other.current == _this.current));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TierDto;
  return Object.hash(runtimeType,_this.key,_this.label,_this.clubScoreFrom,_this.clubScoreTo,_this.earnRatePer100Ks,_this.dailyRedeemLimit,_this.current);
}

@override
String toString() {
  final _this = this as TierDto;
  return 'TierDto(key: ${_this.key}, label: ${_this.label}, clubScoreFrom: ${_this.clubScoreFrom}, clubScoreTo: ${_this.clubScoreTo}, earnRatePer100Ks: ${_this.earnRatePer100Ks}, dailyRedeemLimit: ${_this.dailyRedeemLimit}, current: ${_this.current})';
}


}

/// @nodoc
abstract mixin class $TierDtoCopyWith<$Res>  {
  factory $TierDtoCopyWith(TierDto value, $Res Function(TierDto) _then) = _$TierDtoCopyWithImpl;
@useResult
$Res call({
 String key, String label, int clubScoreFrom, int? clubScoreTo, num earnRatePer100Ks, int? dailyRedeemLimit, bool current
});




}
/// @nodoc
class _$TierDtoCopyWithImpl<$Res>
    implements $TierDtoCopyWith<$Res> {
  _$TierDtoCopyWithImpl(this._self, this._then);

  final TierDto _self;
  final $Res Function(TierDto) _then;

/// Create a copy of TierDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? label = null,Object? clubScoreFrom = null,Object? clubScoreTo = freezed,Object? earnRatePer100Ks = null,Object? dailyRedeemLimit = freezed,Object? current = null,}) {
  return _then(TierDto(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,clubScoreFrom: null == clubScoreFrom ? _self.clubScoreFrom : clubScoreFrom // ignore: cast_nullable_to_non_nullable
as int,clubScoreTo: freezed == clubScoreTo ? _self.clubScoreTo : clubScoreTo // ignore: cast_nullable_to_non_nullable
as int?,earnRatePer100Ks: null == earnRatePer100Ks ? _self.earnRatePer100Ks : earnRatePer100Ks // ignore: cast_nullable_to_non_nullable
as num,dailyRedeemLimit: freezed == dailyRedeemLimit ? _self.dailyRedeemLimit : dailyRedeemLimit // ignore: cast_nullable_to_non_nullable
as int?,current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TierDto].
extension TierDtoPatterns on TierDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TierDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TierDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TierDto value)  $default,){
final _that = this;
switch (_that) {
case _TierDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TierDto value)?  $default,){
final _that = this;
switch (_that) {
case _TierDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String label,  int clubScoreFrom,  int? clubScoreTo,  num earnRatePer100Ks,  int? dailyRedeemLimit,  bool current)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TierDto() when $default != null:
return $default(_that.key,_that.label,_that.clubScoreFrom,_that.clubScoreTo,_that.earnRatePer100Ks,_that.dailyRedeemLimit,_that.current);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String label,  int clubScoreFrom,  int? clubScoreTo,  num earnRatePer100Ks,  int? dailyRedeemLimit,  bool current)  $default,) {final _that = this;
switch (_that) {
case _TierDto():
return $default(_that.key,_that.label,_that.clubScoreFrom,_that.clubScoreTo,_that.earnRatePer100Ks,_that.dailyRedeemLimit,_that.current);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String label,  int clubScoreFrom,  int? clubScoreTo,  num earnRatePer100Ks,  int? dailyRedeemLimit,  bool current)?  $default,) {final _that = this;
switch (_that) {
case _TierDto() when $default != null:
return $default(_that.key,_that.label,_that.clubScoreFrom,_that.clubScoreTo,_that.earnRatePer100Ks,_that.dailyRedeemLimit,_that.current);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TierDto implements TierDto {
  const _TierDto({required this.key, required this.label, required this.clubScoreFrom, this.clubScoreTo, required this.earnRatePer100Ks, this.dailyRedeemLimit, this.current = false});
  factory _TierDto.fromJson(Map<String, dynamic> json) => _$TierDtoFromJson(json);

@override final  String key;
@override final  String label;
@override final  int clubScoreFrom;
@override final  int? clubScoreTo;
@override final  num earnRatePer100Ks;
@override final  int? dailyRedeemLimit;
@override@JsonKey() final  bool current;

/// Create a copy of TierDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TierDtoCopyWith<_TierDto> get copyWith => __$TierDtoCopyWithImpl<_TierDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TierDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TierDto&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label)&&(identical(other.clubScoreFrom, clubScoreFrom) || other.clubScoreFrom == clubScoreFrom)&&(identical(other.clubScoreTo, clubScoreTo) || other.clubScoreTo == clubScoreTo)&&(identical(other.earnRatePer100Ks, earnRatePer100Ks) || other.earnRatePer100Ks == earnRatePer100Ks)&&(identical(other.dailyRedeemLimit, dailyRedeemLimit) || other.dailyRedeemLimit == dailyRedeemLimit)&&(identical(other.current, current) || other.current == current));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,key,label,clubScoreFrom,clubScoreTo,earnRatePer100Ks,dailyRedeemLimit,current);
}

@override
String toString() {
    return 'TierDto(key: $key, label: $label, clubScoreFrom: $clubScoreFrom, clubScoreTo: $clubScoreTo, earnRatePer100Ks: $earnRatePer100Ks, dailyRedeemLimit: $dailyRedeemLimit, current: $current)';
}


}

/// @nodoc
abstract mixin class _$TierDtoCopyWith<$Res> implements $TierDtoCopyWith<$Res> {
  factory _$TierDtoCopyWith(_TierDto value, $Res Function(_TierDto) _then) = __$TierDtoCopyWithImpl;
@override @useResult
$Res call({
 String key, String label, int clubScoreFrom, int? clubScoreTo, num earnRatePer100Ks, int? dailyRedeemLimit, bool current
});




}
/// @nodoc
class __$TierDtoCopyWithImpl<$Res>
    implements _$TierDtoCopyWith<$Res> {
  __$TierDtoCopyWithImpl(this._self, this._then);

  final _TierDto _self;
  final $Res Function(_TierDto) _then;

/// Create a copy of TierDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? label = null,Object? clubScoreFrom = null,Object? clubScoreTo = freezed,Object? earnRatePer100Ks = null,Object? dailyRedeemLimit = freezed,Object? current = null,}) {
  return _then(_TierDto(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,clubScoreFrom: null == clubScoreFrom ? _self.clubScoreFrom : clubScoreFrom // ignore: cast_nullable_to_non_nullable
as int,clubScoreTo: freezed == clubScoreTo ? _self.clubScoreTo : clubScoreTo // ignore: cast_nullable_to_non_nullable
as int?,earnRatePer100Ks: null == earnRatePer100Ks ? _self.earnRatePer100Ks : earnRatePer100Ks // ignore: cast_nullable_to_non_nullable
as num,dailyRedeemLimit: freezed == dailyRedeemLimit ? _self.dailyRedeemLimit : dailyRedeemLimit // ignore: cast_nullable_to_non_nullable
as int?,current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$BenefitDto {

 String get title; String get description; String? get photoUrl;
/// Create a copy of BenefitDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BenefitDtoCopyWith<BenefitDto> get copyWith => _$BenefitDtoCopyWithImpl<BenefitDto>(this as BenefitDto, _$identity);

  /// Serializes this BenefitDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BenefitDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BenefitDto&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.photoUrl, _this.photoUrl) || other.photoUrl == _this.photoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BenefitDto;
  return Object.hash(runtimeType,_this.title,_this.description,_this.photoUrl);
}

@override
String toString() {
  final _this = this as BenefitDto;
  return 'BenefitDto(title: ${_this.title}, description: ${_this.description}, photoUrl: ${_this.photoUrl})';
}


}

/// @nodoc
abstract mixin class $BenefitDtoCopyWith<$Res>  {
  factory $BenefitDtoCopyWith(BenefitDto value, $Res Function(BenefitDto) _then) = _$BenefitDtoCopyWithImpl;
@useResult
$Res call({
 String title, String description, String? photoUrl
});




}
/// @nodoc
class _$BenefitDtoCopyWithImpl<$Res>
    implements $BenefitDtoCopyWith<$Res> {
  _$BenefitDtoCopyWithImpl(this._self, this._then);

  final BenefitDto _self;
  final $Res Function(BenefitDto) _then;

/// Create a copy of BenefitDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? photoUrl = freezed,}) {
  return _then(BenefitDto(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BenefitDto].
extension BenefitDtoPatterns on BenefitDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BenefitDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BenefitDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BenefitDto value)  $default,){
final _that = this;
switch (_that) {
case _BenefitDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BenefitDto value)?  $default,){
final _that = this;
switch (_that) {
case _BenefitDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description,  String? photoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BenefitDto() when $default != null:
return $default(_that.title,_that.description,_that.photoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description,  String? photoUrl)  $default,) {final _that = this;
switch (_that) {
case _BenefitDto():
return $default(_that.title,_that.description,_that.photoUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description,  String? photoUrl)?  $default,) {final _that = this;
switch (_that) {
case _BenefitDto() when $default != null:
return $default(_that.title,_that.description,_that.photoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BenefitDto implements BenefitDto {
  const _BenefitDto({required this.title, required this.description, this.photoUrl});
  factory _BenefitDto.fromJson(Map<String, dynamic> json) => _$BenefitDtoFromJson(json);

@override final  String title;
@override final  String description;
@override final  String? photoUrl;

/// Create a copy of BenefitDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BenefitDtoCopyWith<_BenefitDto> get copyWith => __$BenefitDtoCopyWithImpl<_BenefitDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BenefitDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BenefitDto&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,title,description,photoUrl);
}

@override
String toString() {
    return 'BenefitDto(title: $title, description: $description, photoUrl: $photoUrl)';
}


}

/// @nodoc
abstract mixin class _$BenefitDtoCopyWith<$Res> implements $BenefitDtoCopyWith<$Res> {
  factory _$BenefitDtoCopyWith(_BenefitDto value, $Res Function(_BenefitDto) _then) = __$BenefitDtoCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, String? photoUrl
});




}
/// @nodoc
class __$BenefitDtoCopyWithImpl<$Res>
    implements _$BenefitDtoCopyWith<$Res> {
  __$BenefitDtoCopyWithImpl(this._self, this._then);

  final _BenefitDto _self;
  final $Res Function(_BenefitDto) _then;

/// Create a copy of BenefitDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? photoUrl = freezed,}) {
  return _then(_BenefitDto(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$EarnRuleDto {

 String get condition; int get rewardPoints; int get clubScore;
/// Create a copy of EarnRuleDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EarnRuleDtoCopyWith<EarnRuleDto> get copyWith => _$EarnRuleDtoCopyWithImpl<EarnRuleDto>(this as EarnRuleDto, _$identity);

  /// Serializes this EarnRuleDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as EarnRuleDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EarnRuleDto&&(identical(other.condition, _this.condition) || other.condition == _this.condition)&&(identical(other.rewardPoints, _this.rewardPoints) || other.rewardPoints == _this.rewardPoints)&&(identical(other.clubScore, _this.clubScore) || other.clubScore == _this.clubScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as EarnRuleDto;
  return Object.hash(runtimeType,_this.condition,_this.rewardPoints,_this.clubScore);
}

@override
String toString() {
  final _this = this as EarnRuleDto;
  return 'EarnRuleDto(condition: ${_this.condition}, rewardPoints: ${_this.rewardPoints}, clubScore: ${_this.clubScore})';
}


}

/// @nodoc
abstract mixin class $EarnRuleDtoCopyWith<$Res>  {
  factory $EarnRuleDtoCopyWith(EarnRuleDto value, $Res Function(EarnRuleDto) _then) = _$EarnRuleDtoCopyWithImpl;
@useResult
$Res call({
 String condition, int rewardPoints, int clubScore
});




}
/// @nodoc
class _$EarnRuleDtoCopyWithImpl<$Res>
    implements $EarnRuleDtoCopyWith<$Res> {
  _$EarnRuleDtoCopyWithImpl(this._self, this._then);

  final EarnRuleDto _self;
  final $Res Function(EarnRuleDto) _then;

/// Create a copy of EarnRuleDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? condition = null,Object? rewardPoints = null,Object? clubScore = null,}) {
  return _then(EarnRuleDto(
condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,rewardPoints: null == rewardPoints ? _self.rewardPoints : rewardPoints // ignore: cast_nullable_to_non_nullable
as int,clubScore: null == clubScore ? _self.clubScore : clubScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [EarnRuleDto].
extension EarnRuleDtoPatterns on EarnRuleDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EarnRuleDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EarnRuleDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EarnRuleDto value)  $default,){
final _that = this;
switch (_that) {
case _EarnRuleDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EarnRuleDto value)?  $default,){
final _that = this;
switch (_that) {
case _EarnRuleDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String condition,  int rewardPoints,  int clubScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EarnRuleDto() when $default != null:
return $default(_that.condition,_that.rewardPoints,_that.clubScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String condition,  int rewardPoints,  int clubScore)  $default,) {final _that = this;
switch (_that) {
case _EarnRuleDto():
return $default(_that.condition,_that.rewardPoints,_that.clubScore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String condition,  int rewardPoints,  int clubScore)?  $default,) {final _that = this;
switch (_that) {
case _EarnRuleDto() when $default != null:
return $default(_that.condition,_that.rewardPoints,_that.clubScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EarnRuleDto implements EarnRuleDto {
  const _EarnRuleDto({required this.condition, required this.rewardPoints, required this.clubScore});
  factory _EarnRuleDto.fromJson(Map<String, dynamic> json) => _$EarnRuleDtoFromJson(json);

@override final  String condition;
@override final  int rewardPoints;
@override final  int clubScore;

/// Create a copy of EarnRuleDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EarnRuleDtoCopyWith<_EarnRuleDto> get copyWith => __$EarnRuleDtoCopyWithImpl<_EarnRuleDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EarnRuleDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EarnRuleDto&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.rewardPoints, rewardPoints) || other.rewardPoints == rewardPoints)&&(identical(other.clubScore, clubScore) || other.clubScore == clubScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,condition,rewardPoints,clubScore);
}

@override
String toString() {
    return 'EarnRuleDto(condition: $condition, rewardPoints: $rewardPoints, clubScore: $clubScore)';
}


}

/// @nodoc
abstract mixin class _$EarnRuleDtoCopyWith<$Res> implements $EarnRuleDtoCopyWith<$Res> {
  factory _$EarnRuleDtoCopyWith(_EarnRuleDto value, $Res Function(_EarnRuleDto) _then) = __$EarnRuleDtoCopyWithImpl;
@override @useResult
$Res call({
 String condition, int rewardPoints, int clubScore
});




}
/// @nodoc
class __$EarnRuleDtoCopyWithImpl<$Res>
    implements _$EarnRuleDtoCopyWith<$Res> {
  __$EarnRuleDtoCopyWithImpl(this._self, this._then);

  final _EarnRuleDto _self;
  final $Res Function(_EarnRuleDto) _then;

/// Create a copy of EarnRuleDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? condition = null,Object? rewardPoints = null,Object? clubScore = null,}) {
  return _then(_EarnRuleDto(
condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,rewardPoints: null == rewardPoints ? _self.rewardPoints : rewardPoints // ignore: cast_nullable_to_non_nullable
as int,clubScore: null == clubScore ? _self.clubScore : clubScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TierBenefitsDto {

 List<TierDto> get tiers; List<BenefitDto> get currentBenefits; List<EarnRuleDto> get earnRules;
/// Create a copy of TierBenefitsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TierBenefitsDtoCopyWith<TierBenefitsDto> get copyWith => _$TierBenefitsDtoCopyWithImpl<TierBenefitsDto>(this as TierBenefitsDto, _$identity);

  /// Serializes this TierBenefitsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TierBenefitsDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TierBenefitsDto&&const DeepCollectionEquality().equals(other.tiers, _this.tiers)&&const DeepCollectionEquality().equals(other.currentBenefits, _this.currentBenefits)&&const DeepCollectionEquality().equals(other.earnRules, _this.earnRules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TierBenefitsDto;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.tiers),const DeepCollectionEquality().hash(_this.currentBenefits),const DeepCollectionEquality().hash(_this.earnRules));
}

@override
String toString() {
  final _this = this as TierBenefitsDto;
  return 'TierBenefitsDto(tiers: ${_this.tiers}, currentBenefits: ${_this.currentBenefits}, earnRules: ${_this.earnRules})';
}


}

/// @nodoc
abstract mixin class $TierBenefitsDtoCopyWith<$Res>  {
  factory $TierBenefitsDtoCopyWith(TierBenefitsDto value, $Res Function(TierBenefitsDto) _then) = _$TierBenefitsDtoCopyWithImpl;
@useResult
$Res call({
 List<TierDto> tiers, List<BenefitDto> currentBenefits, List<EarnRuleDto> earnRules
});




}
/// @nodoc
class _$TierBenefitsDtoCopyWithImpl<$Res>
    implements $TierBenefitsDtoCopyWith<$Res> {
  _$TierBenefitsDtoCopyWithImpl(this._self, this._then);

  final TierBenefitsDto _self;
  final $Res Function(TierBenefitsDto) _then;

/// Create a copy of TierBenefitsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tiers = null,Object? currentBenefits = null,Object? earnRules = null,}) {
  return _then(TierBenefitsDto(
tiers: null == tiers ? _self.tiers : tiers // ignore: cast_nullable_to_non_nullable
as List<TierDto>,currentBenefits: null == currentBenefits ? _self.currentBenefits : currentBenefits // ignore: cast_nullable_to_non_nullable
as List<BenefitDto>,earnRules: null == earnRules ? _self.earnRules : earnRules // ignore: cast_nullable_to_non_nullable
as List<EarnRuleDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [TierBenefitsDto].
extension TierBenefitsDtoPatterns on TierBenefitsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TierBenefitsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TierBenefitsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TierBenefitsDto value)  $default,){
final _that = this;
switch (_that) {
case _TierBenefitsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TierBenefitsDto value)?  $default,){
final _that = this;
switch (_that) {
case _TierBenefitsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TierDto> tiers,  List<BenefitDto> currentBenefits,  List<EarnRuleDto> earnRules)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TierBenefitsDto() when $default != null:
return $default(_that.tiers,_that.currentBenefits,_that.earnRules);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TierDto> tiers,  List<BenefitDto> currentBenefits,  List<EarnRuleDto> earnRules)  $default,) {final _that = this;
switch (_that) {
case _TierBenefitsDto():
return $default(_that.tiers,_that.currentBenefits,_that.earnRules);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TierDto> tiers,  List<BenefitDto> currentBenefits,  List<EarnRuleDto> earnRules)?  $default,) {final _that = this;
switch (_that) {
case _TierBenefitsDto() when $default != null:
return $default(_that.tiers,_that.currentBenefits,_that.earnRules);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TierBenefitsDto implements TierBenefitsDto {
  const _TierBenefitsDto({ List<TierDto> tiers = const [],  List<BenefitDto> currentBenefits = const [],  List<EarnRuleDto> earnRules = const []}): _tiers = tiers,_currentBenefits = currentBenefits,_earnRules = earnRules;
  factory _TierBenefitsDto.fromJson(Map<String, dynamic> json) => _$TierBenefitsDtoFromJson(json);

 final  List<TierDto> _tiers;
@override@JsonKey() List<TierDto> get tiers {
  if (_tiers is EqualUnmodifiableListView) return _tiers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tiers);
}

 final  List<BenefitDto> _currentBenefits;
@override@JsonKey() List<BenefitDto> get currentBenefits {
  if (_currentBenefits is EqualUnmodifiableListView) return _currentBenefits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_currentBenefits);
}

 final  List<EarnRuleDto> _earnRules;
@override@JsonKey() List<EarnRuleDto> get earnRules {
  if (_earnRules is EqualUnmodifiableListView) return _earnRules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_earnRules);
}


/// Create a copy of TierBenefitsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TierBenefitsDtoCopyWith<_TierBenefitsDto> get copyWith => __$TierBenefitsDtoCopyWithImpl<_TierBenefitsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TierBenefitsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TierBenefitsDto&&const DeepCollectionEquality().equals(other.tiers, _tiers)&&const DeepCollectionEquality().equals(other.currentBenefits, _currentBenefits)&&const DeepCollectionEquality().equals(other.earnRules, _earnRules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_tiers),const DeepCollectionEquality().hash(_currentBenefits),const DeepCollectionEquality().hash(_earnRules));
}

@override
String toString() {
    return 'TierBenefitsDto(tiers: $tiers, currentBenefits: $currentBenefits, earnRules: $earnRules)';
}


}

/// @nodoc
abstract mixin class _$TierBenefitsDtoCopyWith<$Res> implements $TierBenefitsDtoCopyWith<$Res> {
  factory _$TierBenefitsDtoCopyWith(_TierBenefitsDto value, $Res Function(_TierBenefitsDto) _then) = __$TierBenefitsDtoCopyWithImpl;
@override @useResult
$Res call({
 List<TierDto> tiers, List<BenefitDto> currentBenefits, List<EarnRuleDto> earnRules
});




}
/// @nodoc
class __$TierBenefitsDtoCopyWithImpl<$Res>
    implements _$TierBenefitsDtoCopyWith<$Res> {
  __$TierBenefitsDtoCopyWithImpl(this._self, this._then);

  final _TierBenefitsDto _self;
  final $Res Function(_TierBenefitsDto) _then;

/// Create a copy of TierBenefitsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tiers = null,Object? currentBenefits = null,Object? earnRules = null,}) {
  return _then(_TierBenefitsDto(
tiers: null == tiers ? _self._tiers : tiers // ignore: cast_nullable_to_non_nullable
as List<TierDto>,currentBenefits: null == currentBenefits ? _self._currentBenefits : currentBenefits // ignore: cast_nullable_to_non_nullable
as List<BenefitDto>,earnRules: null == earnRules ? _self._earnRules : earnRules // ignore: cast_nullable_to_non_nullable
as List<EarnRuleDto>,
  ));
}


}


/// @nodoc
mixin _$PointEntryDto {

 String? get transactionId; String get label; String get type; String get at; int get amount; bool get opens;
/// Create a copy of PointEntryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PointEntryDtoCopyWith<PointEntryDto> get copyWith => _$PointEntryDtoCopyWithImpl<PointEntryDto>(this as PointEntryDto, _$identity);

  /// Serializes this PointEntryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PointEntryDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PointEntryDto&&(identical(other.transactionId, _this.transactionId) || other.transactionId == _this.transactionId)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.opens, _this.opens) || other.opens == _this.opens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PointEntryDto;
  return Object.hash(runtimeType,_this.transactionId,_this.label,_this.type,_this.at,_this.amount,_this.opens);
}

@override
String toString() {
  final _this = this as PointEntryDto;
  return 'PointEntryDto(transactionId: ${_this.transactionId}, label: ${_this.label}, type: ${_this.type}, at: ${_this.at}, amount: ${_this.amount}, opens: ${_this.opens})';
}


}

/// @nodoc
abstract mixin class $PointEntryDtoCopyWith<$Res>  {
  factory $PointEntryDtoCopyWith(PointEntryDto value, $Res Function(PointEntryDto) _then) = _$PointEntryDtoCopyWithImpl;
@useResult
$Res call({
 String? transactionId, String label, String type, String at, int amount, bool opens
});




}
/// @nodoc
class _$PointEntryDtoCopyWithImpl<$Res>
    implements $PointEntryDtoCopyWith<$Res> {
  _$PointEntryDtoCopyWithImpl(this._self, this._then);

  final PointEntryDto _self;
  final $Res Function(PointEntryDto) _then;

/// Create a copy of PointEntryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactionId = freezed,Object? label = null,Object? type = null,Object? at = null,Object? amount = null,Object? opens = null,}) {
  return _then(PointEntryDto(
transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,opens: null == opens ? _self.opens : opens // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PointEntryDto].
extension PointEntryDtoPatterns on PointEntryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PointEntryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PointEntryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PointEntryDto value)  $default,){
final _that = this;
switch (_that) {
case _PointEntryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PointEntryDto value)?  $default,){
final _that = this;
switch (_that) {
case _PointEntryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? transactionId,  String label,  String type,  String at,  int amount,  bool opens)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PointEntryDto() when $default != null:
return $default(_that.transactionId,_that.label,_that.type,_that.at,_that.amount,_that.opens);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? transactionId,  String label,  String type,  String at,  int amount,  bool opens)  $default,) {final _that = this;
switch (_that) {
case _PointEntryDto():
return $default(_that.transactionId,_that.label,_that.type,_that.at,_that.amount,_that.opens);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? transactionId,  String label,  String type,  String at,  int amount,  bool opens)?  $default,) {final _that = this;
switch (_that) {
case _PointEntryDto() when $default != null:
return $default(_that.transactionId,_that.label,_that.type,_that.at,_that.amount,_that.opens);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PointEntryDto implements PointEntryDto {
  const _PointEntryDto({this.transactionId, required this.label, required this.type, required this.at, required this.amount, this.opens = false});
  factory _PointEntryDto.fromJson(Map<String, dynamic> json) => _$PointEntryDtoFromJson(json);

@override final  String? transactionId;
@override final  String label;
@override final  String type;
@override final  String at;
@override final  int amount;
@override@JsonKey() final  bool opens;

/// Create a copy of PointEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PointEntryDtoCopyWith<_PointEntryDto> get copyWith => __$PointEntryDtoCopyWithImpl<_PointEntryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PointEntryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PointEntryDto&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type)&&(identical(other.at, at) || other.at == at)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.opens, opens) || other.opens == opens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,transactionId,label,type,at,amount,opens);
}

@override
String toString() {
    return 'PointEntryDto(transactionId: $transactionId, label: $label, type: $type, at: $at, amount: $amount, opens: $opens)';
}


}

/// @nodoc
abstract mixin class _$PointEntryDtoCopyWith<$Res> implements $PointEntryDtoCopyWith<$Res> {
  factory _$PointEntryDtoCopyWith(_PointEntryDto value, $Res Function(_PointEntryDto) _then) = __$PointEntryDtoCopyWithImpl;
@override @useResult
$Res call({
 String? transactionId, String label, String type, String at, int amount, bool opens
});




}
/// @nodoc
class __$PointEntryDtoCopyWithImpl<$Res>
    implements _$PointEntryDtoCopyWith<$Res> {
  __$PointEntryDtoCopyWithImpl(this._self, this._then);

  final _PointEntryDto _self;
  final $Res Function(_PointEntryDto) _then;

/// Create a copy of PointEntryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactionId = freezed,Object? label = null,Object? type = null,Object? at = null,Object? amount = null,Object? opens = null,}) {
  return _then(_PointEntryDto(
transactionId: freezed == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,opens: null == opens ? _self.opens : opens // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$PointDetailRowDto {

 String get label; String get value;
/// Create a copy of PointDetailRowDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PointDetailRowDtoCopyWith<PointDetailRowDto> get copyWith => _$PointDetailRowDtoCopyWithImpl<PointDetailRowDto>(this as PointDetailRowDto, _$identity);

  /// Serializes this PointDetailRowDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PointDetailRowDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PointDetailRowDto&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.value, _this.value) || other.value == _this.value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PointDetailRowDto;
  return Object.hash(runtimeType,_this.label,_this.value);
}

@override
String toString() {
  final _this = this as PointDetailRowDto;
  return 'PointDetailRowDto(label: ${_this.label}, value: ${_this.value})';
}


}

/// @nodoc
abstract mixin class $PointDetailRowDtoCopyWith<$Res>  {
  factory $PointDetailRowDtoCopyWith(PointDetailRowDto value, $Res Function(PointDetailRowDto) _then) = _$PointDetailRowDtoCopyWithImpl;
@useResult
$Res call({
 String label, String value
});




}
/// @nodoc
class _$PointDetailRowDtoCopyWithImpl<$Res>
    implements $PointDetailRowDtoCopyWith<$Res> {
  _$PointDetailRowDtoCopyWithImpl(this._self, this._then);

  final PointDetailRowDto _self;
  final $Res Function(PointDetailRowDto) _then;

/// Create a copy of PointDetailRowDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? value = null,}) {
  return _then(PointDetailRowDto(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PointDetailRowDto].
extension PointDetailRowDtoPatterns on PointDetailRowDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PointDetailRowDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PointDetailRowDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PointDetailRowDto value)  $default,){
final _that = this;
switch (_that) {
case _PointDetailRowDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PointDetailRowDto value)?  $default,){
final _that = this;
switch (_that) {
case _PointDetailRowDto() when $default != null:
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
case _PointDetailRowDto() when $default != null:
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
case _PointDetailRowDto():
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
case _PointDetailRowDto() when $default != null:
return $default(_that.label,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PointDetailRowDto implements PointDetailRowDto {
  const _PointDetailRowDto({required this.label, required this.value});
  factory _PointDetailRowDto.fromJson(Map<String, dynamic> json) => _$PointDetailRowDtoFromJson(json);

@override final  String label;
@override final  String value;

/// Create a copy of PointDetailRowDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PointDetailRowDtoCopyWith<_PointDetailRowDto> get copyWith => __$PointDetailRowDtoCopyWithImpl<_PointDetailRowDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PointDetailRowDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PointDetailRowDto&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,label,value);
}

@override
String toString() {
    return 'PointDetailRowDto(label: $label, value: $value)';
}


}

/// @nodoc
abstract mixin class _$PointDetailRowDtoCopyWith<$Res> implements $PointDetailRowDtoCopyWith<$Res> {
  factory _$PointDetailRowDtoCopyWith(_PointDetailRowDto value, $Res Function(_PointDetailRowDto) _then) = __$PointDetailRowDtoCopyWithImpl;
@override @useResult
$Res call({
 String label, String value
});




}
/// @nodoc
class __$PointDetailRowDtoCopyWithImpl<$Res>
    implements _$PointDetailRowDtoCopyWith<$Res> {
  __$PointDetailRowDtoCopyWithImpl(this._self, this._then);

  final _PointDetailRowDto _self;
  final $Res Function(_PointDetailRowDto) _then;

/// Create a copy of PointDetailRowDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? value = null,}) {
  return _then(_PointDetailRowDto(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PointDetailDto {

 String get transactionId; String get label; String get type; String get at; int get amount; String get unit; List<PointDetailRowDto> get rows; String? get note;
/// Create a copy of PointDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PointDetailDtoCopyWith<PointDetailDto> get copyWith => _$PointDetailDtoCopyWithImpl<PointDetailDto>(this as PointDetailDto, _$identity);

  /// Serializes this PointDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PointDetailDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PointDetailDto&&(identical(other.transactionId, _this.transactionId) || other.transactionId == _this.transactionId)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.unit, _this.unit) || other.unit == _this.unit)&&const DeepCollectionEquality().equals(other.rows, _this.rows)&&(identical(other.note, _this.note) || other.note == _this.note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PointDetailDto;
  return Object.hash(runtimeType,_this.transactionId,_this.label,_this.type,_this.at,_this.amount,_this.unit,const DeepCollectionEquality().hash(_this.rows),_this.note);
}

@override
String toString() {
  final _this = this as PointDetailDto;
  return 'PointDetailDto(transactionId: ${_this.transactionId}, label: ${_this.label}, type: ${_this.type}, at: ${_this.at}, amount: ${_this.amount}, unit: ${_this.unit}, rows: ${_this.rows}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $PointDetailDtoCopyWith<$Res>  {
  factory $PointDetailDtoCopyWith(PointDetailDto value, $Res Function(PointDetailDto) _then) = _$PointDetailDtoCopyWithImpl;
@useResult
$Res call({
 String transactionId, String label, String type, String at, int amount, String unit, List<PointDetailRowDto> rows, String? note
});




}
/// @nodoc
class _$PointDetailDtoCopyWithImpl<$Res>
    implements $PointDetailDtoCopyWith<$Res> {
  _$PointDetailDtoCopyWithImpl(this._self, this._then);

  final PointDetailDto _self;
  final $Res Function(PointDetailDto) _then;

/// Create a copy of PointDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactionId = null,Object? label = null,Object? type = null,Object? at = null,Object? amount = null,Object? unit = null,Object? rows = null,Object? note = freezed,}) {
  return _then(PointDetailDto(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,rows: null == rows ? _self.rows : rows // ignore: cast_nullable_to_non_nullable
as List<PointDetailRowDto>,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PointDetailDto].
extension PointDetailDtoPatterns on PointDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PointDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PointDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PointDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _PointDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PointDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _PointDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String transactionId,  String label,  String type,  String at,  int amount,  String unit,  List<PointDetailRowDto> rows,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PointDetailDto() when $default != null:
return $default(_that.transactionId,_that.label,_that.type,_that.at,_that.amount,_that.unit,_that.rows,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String transactionId,  String label,  String type,  String at,  int amount,  String unit,  List<PointDetailRowDto> rows,  String? note)  $default,) {final _that = this;
switch (_that) {
case _PointDetailDto():
return $default(_that.transactionId,_that.label,_that.type,_that.at,_that.amount,_that.unit,_that.rows,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String transactionId,  String label,  String type,  String at,  int amount,  String unit,  List<PointDetailRowDto> rows,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _PointDetailDto() when $default != null:
return $default(_that.transactionId,_that.label,_that.type,_that.at,_that.amount,_that.unit,_that.rows,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PointDetailDto implements PointDetailDto {
  const _PointDetailDto({required this.transactionId, required this.label, required this.type, required this.at, required this.amount, this.unit = 'Shopping Points',  List<PointDetailRowDto> rows = const [], this.note}): _rows = rows;
  factory _PointDetailDto.fromJson(Map<String, dynamic> json) => _$PointDetailDtoFromJson(json);

@override final  String transactionId;
@override final  String label;
@override final  String type;
@override final  String at;
@override final  int amount;
@override@JsonKey() final  String unit;
 final  List<PointDetailRowDto> _rows;
@override@JsonKey() List<PointDetailRowDto> get rows {
  if (_rows is EqualUnmodifiableListView) return _rows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rows);
}

@override final  String? note;

/// Create a copy of PointDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PointDetailDtoCopyWith<_PointDetailDto> get copyWith => __$PointDetailDtoCopyWithImpl<_PointDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PointDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PointDetailDto&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type)&&(identical(other.at, at) || other.at == at)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.unit, unit) || other.unit == unit)&&const DeepCollectionEquality().equals(other.rows, _rows)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,transactionId,label,type,at,amount,unit,const DeepCollectionEquality().hash(_rows),note);
}

@override
String toString() {
    return 'PointDetailDto(transactionId: $transactionId, label: $label, type: $type, at: $at, amount: $amount, unit: $unit, rows: $rows, note: $note)';
}


}

/// @nodoc
abstract mixin class _$PointDetailDtoCopyWith<$Res> implements $PointDetailDtoCopyWith<$Res> {
  factory _$PointDetailDtoCopyWith(_PointDetailDto value, $Res Function(_PointDetailDto) _then) = __$PointDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 String transactionId, String label, String type, String at, int amount, String unit, List<PointDetailRowDto> rows, String? note
});




}
/// @nodoc
class __$PointDetailDtoCopyWithImpl<$Res>
    implements _$PointDetailDtoCopyWith<$Res> {
  __$PointDetailDtoCopyWithImpl(this._self, this._then);

  final _PointDetailDto _self;
  final $Res Function(_PointDetailDto) _then;

/// Create a copy of PointDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactionId = null,Object? label = null,Object? type = null,Object? at = null,Object? amount = null,Object? unit = null,Object? rows = null,Object? note = freezed,}) {
  return _then(_PointDetailDto(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,rows: null == rows ? _self._rows : rows // ignore: cast_nullable_to_non_nullable
as List<PointDetailRowDto>,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TransferPreviewDto {

 String get recipientName; String get recipientPhoneDisplay; String? get recipientTier; int get amount; int get balanceAfter; String get note;
/// Create a copy of TransferPreviewDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferPreviewDtoCopyWith<TransferPreviewDto> get copyWith => _$TransferPreviewDtoCopyWithImpl<TransferPreviewDto>(this as TransferPreviewDto, _$identity);

  /// Serializes this TransferPreviewDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TransferPreviewDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferPreviewDto&&(identical(other.recipientName, _this.recipientName) || other.recipientName == _this.recipientName)&&(identical(other.recipientPhoneDisplay, _this.recipientPhoneDisplay) || other.recipientPhoneDisplay == _this.recipientPhoneDisplay)&&(identical(other.recipientTier, _this.recipientTier) || other.recipientTier == _this.recipientTier)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.balanceAfter, _this.balanceAfter) || other.balanceAfter == _this.balanceAfter)&&(identical(other.note, _this.note) || other.note == _this.note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TransferPreviewDto;
  return Object.hash(runtimeType,_this.recipientName,_this.recipientPhoneDisplay,_this.recipientTier,_this.amount,_this.balanceAfter,_this.note);
}

@override
String toString() {
  final _this = this as TransferPreviewDto;
  return 'TransferPreviewDto(recipientName: ${_this.recipientName}, recipientPhoneDisplay: ${_this.recipientPhoneDisplay}, recipientTier: ${_this.recipientTier}, amount: ${_this.amount}, balanceAfter: ${_this.balanceAfter}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $TransferPreviewDtoCopyWith<$Res>  {
  factory $TransferPreviewDtoCopyWith(TransferPreviewDto value, $Res Function(TransferPreviewDto) _then) = _$TransferPreviewDtoCopyWithImpl;
@useResult
$Res call({
 String recipientName, String recipientPhoneDisplay, String? recipientTier, int amount, int balanceAfter, String note
});




}
/// @nodoc
class _$TransferPreviewDtoCopyWithImpl<$Res>
    implements $TransferPreviewDtoCopyWith<$Res> {
  _$TransferPreviewDtoCopyWithImpl(this._self, this._then);

  final TransferPreviewDto _self;
  final $Res Function(TransferPreviewDto) _then;

/// Create a copy of TransferPreviewDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipientName = null,Object? recipientPhoneDisplay = null,Object? recipientTier = freezed,Object? amount = null,Object? balanceAfter = null,Object? note = null,}) {
  return _then(TransferPreviewDto(
recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,recipientPhoneDisplay: null == recipientPhoneDisplay ? _self.recipientPhoneDisplay : recipientPhoneDisplay // ignore: cast_nullable_to_non_nullable
as String,recipientTier: freezed == recipientTier ? _self.recipientTier : recipientTier // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,balanceAfter: null == balanceAfter ? _self.balanceAfter : balanceAfter // ignore: cast_nullable_to_non_nullable
as int,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TransferPreviewDto].
extension TransferPreviewDtoPatterns on TransferPreviewDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransferPreviewDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransferPreviewDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransferPreviewDto value)  $default,){
final _that = this;
switch (_that) {
case _TransferPreviewDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransferPreviewDto value)?  $default,){
final _that = this;
switch (_that) {
case _TransferPreviewDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String recipientName,  String recipientPhoneDisplay,  String? recipientTier,  int amount,  int balanceAfter,  String note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransferPreviewDto() when $default != null:
return $default(_that.recipientName,_that.recipientPhoneDisplay,_that.recipientTier,_that.amount,_that.balanceAfter,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String recipientName,  String recipientPhoneDisplay,  String? recipientTier,  int amount,  int balanceAfter,  String note)  $default,) {final _that = this;
switch (_that) {
case _TransferPreviewDto():
return $default(_that.recipientName,_that.recipientPhoneDisplay,_that.recipientTier,_that.amount,_that.balanceAfter,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String recipientName,  String recipientPhoneDisplay,  String? recipientTier,  int amount,  int balanceAfter,  String note)?  $default,) {final _that = this;
switch (_that) {
case _TransferPreviewDto() when $default != null:
return $default(_that.recipientName,_that.recipientPhoneDisplay,_that.recipientTier,_that.amount,_that.balanceAfter,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransferPreviewDto implements TransferPreviewDto {
  const _TransferPreviewDto({required this.recipientName, required this.recipientPhoneDisplay, this.recipientTier, required this.amount, required this.balanceAfter, this.note = ''});
  factory _TransferPreviewDto.fromJson(Map<String, dynamic> json) => _$TransferPreviewDtoFromJson(json);

@override final  String recipientName;
@override final  String recipientPhoneDisplay;
@override final  String? recipientTier;
@override final  int amount;
@override final  int balanceAfter;
@override@JsonKey() final  String note;

/// Create a copy of TransferPreviewDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferPreviewDtoCopyWith<_TransferPreviewDto> get copyWith => __$TransferPreviewDtoCopyWithImpl<_TransferPreviewDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferPreviewDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferPreviewDto&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.recipientPhoneDisplay, recipientPhoneDisplay) || other.recipientPhoneDisplay == recipientPhoneDisplay)&&(identical(other.recipientTier, recipientTier) || other.recipientTier == recipientTier)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.balanceAfter, balanceAfter) || other.balanceAfter == balanceAfter)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,recipientName,recipientPhoneDisplay,recipientTier,amount,balanceAfter,note);
}

@override
String toString() {
    return 'TransferPreviewDto(recipientName: $recipientName, recipientPhoneDisplay: $recipientPhoneDisplay, recipientTier: $recipientTier, amount: $amount, balanceAfter: $balanceAfter, note: $note)';
}


}

/// @nodoc
abstract mixin class _$TransferPreviewDtoCopyWith<$Res> implements $TransferPreviewDtoCopyWith<$Res> {
  factory _$TransferPreviewDtoCopyWith(_TransferPreviewDto value, $Res Function(_TransferPreviewDto) _then) = __$TransferPreviewDtoCopyWithImpl;
@override @useResult
$Res call({
 String recipientName, String recipientPhoneDisplay, String? recipientTier, int amount, int balanceAfter, String note
});




}
/// @nodoc
class __$TransferPreviewDtoCopyWithImpl<$Res>
    implements _$TransferPreviewDtoCopyWith<$Res> {
  __$TransferPreviewDtoCopyWithImpl(this._self, this._then);

  final _TransferPreviewDto _self;
  final $Res Function(_TransferPreviewDto) _then;

/// Create a copy of TransferPreviewDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipientName = null,Object? recipientPhoneDisplay = null,Object? recipientTier = freezed,Object? amount = null,Object? balanceAfter = null,Object? note = null,}) {
  return _then(_TransferPreviewDto(
recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,recipientPhoneDisplay: null == recipientPhoneDisplay ? _self.recipientPhoneDisplay : recipientPhoneDisplay // ignore: cast_nullable_to_non_nullable
as String,recipientTier: freezed == recipientTier ? _self.recipientTier : recipientTier // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,balanceAfter: null == balanceAfter ? _self.balanceAfter : balanceAfter // ignore: cast_nullable_to_non_nullable
as int,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TransferResultDto {

 String get transactionId; String get recipientName; int get amount; int get balance; String get at;
/// Create a copy of TransferResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferResultDtoCopyWith<TransferResultDto> get copyWith => _$TransferResultDtoCopyWithImpl<TransferResultDto>(this as TransferResultDto, _$identity);

  /// Serializes this TransferResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TransferResultDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferResultDto&&(identical(other.transactionId, _this.transactionId) || other.transactionId == _this.transactionId)&&(identical(other.recipientName, _this.recipientName) || other.recipientName == _this.recipientName)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.balance, _this.balance) || other.balance == _this.balance)&&(identical(other.at, _this.at) || other.at == _this.at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TransferResultDto;
  return Object.hash(runtimeType,_this.transactionId,_this.recipientName,_this.amount,_this.balance,_this.at);
}

@override
String toString() {
  final _this = this as TransferResultDto;
  return 'TransferResultDto(transactionId: ${_this.transactionId}, recipientName: ${_this.recipientName}, amount: ${_this.amount}, balance: ${_this.balance}, at: ${_this.at})';
}


}

/// @nodoc
abstract mixin class $TransferResultDtoCopyWith<$Res>  {
  factory $TransferResultDtoCopyWith(TransferResultDto value, $Res Function(TransferResultDto) _then) = _$TransferResultDtoCopyWithImpl;
@useResult
$Res call({
 String transactionId, String recipientName, int amount, int balance, String at
});




}
/// @nodoc
class _$TransferResultDtoCopyWithImpl<$Res>
    implements $TransferResultDtoCopyWith<$Res> {
  _$TransferResultDtoCopyWithImpl(this._self, this._then);

  final TransferResultDto _self;
  final $Res Function(TransferResultDto) _then;

/// Create a copy of TransferResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? transactionId = null,Object? recipientName = null,Object? amount = null,Object? balance = null,Object? at = null,}) {
  return _then(TransferResultDto(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TransferResultDto].
extension TransferResultDtoPatterns on TransferResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransferResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransferResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransferResultDto value)  $default,){
final _that = this;
switch (_that) {
case _TransferResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransferResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _TransferResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String transactionId,  String recipientName,  int amount,  int balance,  String at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransferResultDto() when $default != null:
return $default(_that.transactionId,_that.recipientName,_that.amount,_that.balance,_that.at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String transactionId,  String recipientName,  int amount,  int balance,  String at)  $default,) {final _that = this;
switch (_that) {
case _TransferResultDto():
return $default(_that.transactionId,_that.recipientName,_that.amount,_that.balance,_that.at);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String transactionId,  String recipientName,  int amount,  int balance,  String at)?  $default,) {final _that = this;
switch (_that) {
case _TransferResultDto() when $default != null:
return $default(_that.transactionId,_that.recipientName,_that.amount,_that.balance,_that.at);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransferResultDto implements TransferResultDto {
  const _TransferResultDto({required this.transactionId, required this.recipientName, required this.amount, required this.balance, required this.at});
  factory _TransferResultDto.fromJson(Map<String, dynamic> json) => _$TransferResultDtoFromJson(json);

@override final  String transactionId;
@override final  String recipientName;
@override final  int amount;
@override final  int balance;
@override final  String at;

/// Create a copy of TransferResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransferResultDtoCopyWith<_TransferResultDto> get copyWith => __$TransferResultDtoCopyWithImpl<_TransferResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransferResultDto&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.recipientName, recipientName) || other.recipientName == recipientName)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.at, at) || other.at == at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,transactionId,recipientName,amount,balance,at);
}

@override
String toString() {
    return 'TransferResultDto(transactionId: $transactionId, recipientName: $recipientName, amount: $amount, balance: $balance, at: $at)';
}


}

/// @nodoc
abstract mixin class _$TransferResultDtoCopyWith<$Res> implements $TransferResultDtoCopyWith<$Res> {
  factory _$TransferResultDtoCopyWith(_TransferResultDto value, $Res Function(_TransferResultDto) _then) = __$TransferResultDtoCopyWithImpl;
@override @useResult
$Res call({
 String transactionId, String recipientName, int amount, int balance, String at
});




}
/// @nodoc
class __$TransferResultDtoCopyWithImpl<$Res>
    implements _$TransferResultDtoCopyWith<$Res> {
  __$TransferResultDtoCopyWithImpl(this._self, this._then);

  final _TransferResultDto _self;
  final $Res Function(_TransferResultDto) _then;

/// Create a copy of TransferResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? transactionId = null,Object? recipientName = null,Object? amount = null,Object? balance = null,Object? at = null,}) {
  return _then(_TransferResultDto(
transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,recipientName: null == recipientName ? _self.recipientName : recipientName // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TopupCodeDto {

 String get code; int get points; String? get pointsExpireOn; String? get owner; String? get terms; bool get redeemed; int? get balance;
/// Create a copy of TopupCodeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopupCodeDtoCopyWith<TopupCodeDto> get copyWith => _$TopupCodeDtoCopyWithImpl<TopupCodeDto>(this as TopupCodeDto, _$identity);

  /// Serializes this TopupCodeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TopupCodeDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopupCodeDto&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.points, _this.points) || other.points == _this.points)&&(identical(other.pointsExpireOn, _this.pointsExpireOn) || other.pointsExpireOn == _this.pointsExpireOn)&&(identical(other.owner, _this.owner) || other.owner == _this.owner)&&(identical(other.terms, _this.terms) || other.terms == _this.terms)&&(identical(other.redeemed, _this.redeemed) || other.redeemed == _this.redeemed)&&(identical(other.balance, _this.balance) || other.balance == _this.balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TopupCodeDto;
  return Object.hash(runtimeType,_this.code,_this.points,_this.pointsExpireOn,_this.owner,_this.terms,_this.redeemed,_this.balance);
}

@override
String toString() {
  final _this = this as TopupCodeDto;
  return 'TopupCodeDto(code: ${_this.code}, points: ${_this.points}, pointsExpireOn: ${_this.pointsExpireOn}, owner: ${_this.owner}, terms: ${_this.terms}, redeemed: ${_this.redeemed}, balance: ${_this.balance})';
}


}

/// @nodoc
abstract mixin class $TopupCodeDtoCopyWith<$Res>  {
  factory $TopupCodeDtoCopyWith(TopupCodeDto value, $Res Function(TopupCodeDto) _then) = _$TopupCodeDtoCopyWithImpl;
@useResult
$Res call({
 String code, int points, String? pointsExpireOn, String? owner, String? terms, bool redeemed, int? balance
});




}
/// @nodoc
class _$TopupCodeDtoCopyWithImpl<$Res>
    implements $TopupCodeDtoCopyWith<$Res> {
  _$TopupCodeDtoCopyWithImpl(this._self, this._then);

  final TopupCodeDto _self;
  final $Res Function(TopupCodeDto) _then;

/// Create a copy of TopupCodeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? points = null,Object? pointsExpireOn = freezed,Object? owner = freezed,Object? terms = freezed,Object? redeemed = null,Object? balance = freezed,}) {
  return _then(TopupCodeDto(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,pointsExpireOn: freezed == pointsExpireOn ? _self.pointsExpireOn : pointsExpireOn // ignore: cast_nullable_to_non_nullable
as String?,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as String?,terms: freezed == terms ? _self.terms : terms // ignore: cast_nullable_to_non_nullable
as String?,redeemed: null == redeemed ? _self.redeemed : redeemed // ignore: cast_nullable_to_non_nullable
as bool,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TopupCodeDto].
extension TopupCodeDtoPatterns on TopupCodeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopupCodeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopupCodeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopupCodeDto value)  $default,){
final _that = this;
switch (_that) {
case _TopupCodeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopupCodeDto value)?  $default,){
final _that = this;
switch (_that) {
case _TopupCodeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  int points,  String? pointsExpireOn,  String? owner,  String? terms,  bool redeemed,  int? balance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopupCodeDto() when $default != null:
return $default(_that.code,_that.points,_that.pointsExpireOn,_that.owner,_that.terms,_that.redeemed,_that.balance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  int points,  String? pointsExpireOn,  String? owner,  String? terms,  bool redeemed,  int? balance)  $default,) {final _that = this;
switch (_that) {
case _TopupCodeDto():
return $default(_that.code,_that.points,_that.pointsExpireOn,_that.owner,_that.terms,_that.redeemed,_that.balance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  int points,  String? pointsExpireOn,  String? owner,  String? terms,  bool redeemed,  int? balance)?  $default,) {final _that = this;
switch (_that) {
case _TopupCodeDto() when $default != null:
return $default(_that.code,_that.points,_that.pointsExpireOn,_that.owner,_that.terms,_that.redeemed,_that.balance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopupCodeDto implements TopupCodeDto {
  const _TopupCodeDto({required this.code, required this.points, this.pointsExpireOn, this.owner, this.terms, this.redeemed = false, this.balance});
  factory _TopupCodeDto.fromJson(Map<String, dynamic> json) => _$TopupCodeDtoFromJson(json);

@override final  String code;
@override final  int points;
@override final  String? pointsExpireOn;
@override final  String? owner;
@override final  String? terms;
@override@JsonKey() final  bool redeemed;
@override final  int? balance;

/// Create a copy of TopupCodeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopupCodeDtoCopyWith<_TopupCodeDto> get copyWith => __$TopupCodeDtoCopyWithImpl<_TopupCodeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopupCodeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopupCodeDto&&(identical(other.code, code) || other.code == code)&&(identical(other.points, points) || other.points == points)&&(identical(other.pointsExpireOn, pointsExpireOn) || other.pointsExpireOn == pointsExpireOn)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.terms, terms) || other.terms == terms)&&(identical(other.redeemed, redeemed) || other.redeemed == redeemed)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,code,points,pointsExpireOn,owner,terms,redeemed,balance);
}

@override
String toString() {
    return 'TopupCodeDto(code: $code, points: $points, pointsExpireOn: $pointsExpireOn, owner: $owner, terms: $terms, redeemed: $redeemed, balance: $balance)';
}


}

/// @nodoc
abstract mixin class _$TopupCodeDtoCopyWith<$Res> implements $TopupCodeDtoCopyWith<$Res> {
  factory _$TopupCodeDtoCopyWith(_TopupCodeDto value, $Res Function(_TopupCodeDto) _then) = __$TopupCodeDtoCopyWithImpl;
@override @useResult
$Res call({
 String code, int points, String? pointsExpireOn, String? owner, String? terms, bool redeemed, int? balance
});




}
/// @nodoc
class __$TopupCodeDtoCopyWithImpl<$Res>
    implements _$TopupCodeDtoCopyWith<$Res> {
  __$TopupCodeDtoCopyWithImpl(this._self, this._then);

  final _TopupCodeDto _self;
  final $Res Function(_TopupCodeDto) _then;

/// Create a copy of TopupCodeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? points = null,Object? pointsExpireOn = freezed,Object? owner = freezed,Object? terms = freezed,Object? redeemed = null,Object? balance = freezed,}) {
  return _then(_TopupCodeDto(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,pointsExpireOn: freezed == pointsExpireOn ? _self.pointsExpireOn : pointsExpireOn // ignore: cast_nullable_to_non_nullable
as String?,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as String?,terms: freezed == terms ? _self.terms : terms // ignore: cast_nullable_to_non_nullable
as String?,redeemed: null == redeemed ? _self.redeemed : redeemed // ignore: cast_nullable_to_non_nullable
as bool,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$MemberQrDto {

 String get payload; String get expiresAt; String get memberName; String get tierLabel; String get phoneDisplay; int get points;
/// Create a copy of MemberQrDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberQrDtoCopyWith<MemberQrDto> get copyWith => _$MemberQrDtoCopyWithImpl<MemberQrDto>(this as MemberQrDto, _$identity);

  /// Serializes this MemberQrDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MemberQrDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberQrDto&&(identical(other.payload, _this.payload) || other.payload == _this.payload)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt)&&(identical(other.memberName, _this.memberName) || other.memberName == _this.memberName)&&(identical(other.tierLabel, _this.tierLabel) || other.tierLabel == _this.tierLabel)&&(identical(other.phoneDisplay, _this.phoneDisplay) || other.phoneDisplay == _this.phoneDisplay)&&(identical(other.points, _this.points) || other.points == _this.points));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MemberQrDto;
  return Object.hash(runtimeType,_this.payload,_this.expiresAt,_this.memberName,_this.tierLabel,_this.phoneDisplay,_this.points);
}

@override
String toString() {
  final _this = this as MemberQrDto;
  return 'MemberQrDto(payload: ${_this.payload}, expiresAt: ${_this.expiresAt}, memberName: ${_this.memberName}, tierLabel: ${_this.tierLabel}, phoneDisplay: ${_this.phoneDisplay}, points: ${_this.points})';
}


}

/// @nodoc
abstract mixin class $MemberQrDtoCopyWith<$Res>  {
  factory $MemberQrDtoCopyWith(MemberQrDto value, $Res Function(MemberQrDto) _then) = _$MemberQrDtoCopyWithImpl;
@useResult
$Res call({
 String payload, String expiresAt, String memberName, String tierLabel, String phoneDisplay, int points
});




}
/// @nodoc
class _$MemberQrDtoCopyWithImpl<$Res>
    implements $MemberQrDtoCopyWith<$Res> {
  _$MemberQrDtoCopyWithImpl(this._self, this._then);

  final MemberQrDto _self;
  final $Res Function(MemberQrDto) _then;

/// Create a copy of MemberQrDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? payload = null,Object? expiresAt = null,Object? memberName = null,Object? tierLabel = null,Object? phoneDisplay = null,Object? points = null,}) {
  return _then(MemberQrDto(
payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,memberName: null == memberName ? _self.memberName : memberName // ignore: cast_nullable_to_non_nullable
as String,tierLabel: null == tierLabel ? _self.tierLabel : tierLabel // ignore: cast_nullable_to_non_nullable
as String,phoneDisplay: null == phoneDisplay ? _self.phoneDisplay : phoneDisplay // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MemberQrDto].
extension MemberQrDtoPatterns on MemberQrDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemberQrDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemberQrDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemberQrDto value)  $default,){
final _that = this;
switch (_that) {
case _MemberQrDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemberQrDto value)?  $default,){
final _that = this;
switch (_that) {
case _MemberQrDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String payload,  String expiresAt,  String memberName,  String tierLabel,  String phoneDisplay,  int points)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemberQrDto() when $default != null:
return $default(_that.payload,_that.expiresAt,_that.memberName,_that.tierLabel,_that.phoneDisplay,_that.points);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String payload,  String expiresAt,  String memberName,  String tierLabel,  String phoneDisplay,  int points)  $default,) {final _that = this;
switch (_that) {
case _MemberQrDto():
return $default(_that.payload,_that.expiresAt,_that.memberName,_that.tierLabel,_that.phoneDisplay,_that.points);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String payload,  String expiresAt,  String memberName,  String tierLabel,  String phoneDisplay,  int points)?  $default,) {final _that = this;
switch (_that) {
case _MemberQrDto() when $default != null:
return $default(_that.payload,_that.expiresAt,_that.memberName,_that.tierLabel,_that.phoneDisplay,_that.points);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MemberQrDto implements MemberQrDto {
  const _MemberQrDto({required this.payload, required this.expiresAt, required this.memberName, required this.tierLabel, required this.phoneDisplay, required this.points});
  factory _MemberQrDto.fromJson(Map<String, dynamic> json) => _$MemberQrDtoFromJson(json);

@override final  String payload;
@override final  String expiresAt;
@override final  String memberName;
@override final  String tierLabel;
@override final  String phoneDisplay;
@override final  int points;

/// Create a copy of MemberQrDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberQrDtoCopyWith<_MemberQrDto> get copyWith => __$MemberQrDtoCopyWithImpl<_MemberQrDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemberQrDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberQrDto&&(identical(other.payload, payload) || other.payload == payload)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.memberName, memberName) || other.memberName == memberName)&&(identical(other.tierLabel, tierLabel) || other.tierLabel == tierLabel)&&(identical(other.phoneDisplay, phoneDisplay) || other.phoneDisplay == phoneDisplay)&&(identical(other.points, points) || other.points == points));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,payload,expiresAt,memberName,tierLabel,phoneDisplay,points);
}

@override
String toString() {
    return 'MemberQrDto(payload: $payload, expiresAt: $expiresAt, memberName: $memberName, tierLabel: $tierLabel, phoneDisplay: $phoneDisplay, points: $points)';
}


}

/// @nodoc
abstract mixin class _$MemberQrDtoCopyWith<$Res> implements $MemberQrDtoCopyWith<$Res> {
  factory _$MemberQrDtoCopyWith(_MemberQrDto value, $Res Function(_MemberQrDto) _then) = __$MemberQrDtoCopyWithImpl;
@override @useResult
$Res call({
 String payload, String expiresAt, String memberName, String tierLabel, String phoneDisplay, int points
});




}
/// @nodoc
class __$MemberQrDtoCopyWithImpl<$Res>
    implements _$MemberQrDtoCopyWith<$Res> {
  __$MemberQrDtoCopyWithImpl(this._self, this._then);

  final _MemberQrDto _self;
  final $Res Function(_MemberQrDto) _then;

/// Create a copy of MemberQrDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? payload = null,Object? expiresAt = null,Object? memberName = null,Object? tierLabel = null,Object? phoneDisplay = null,Object? points = null,}) {
  return _then(_MemberQrDto(
payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,memberName: null == memberName ? _self.memberName : memberName // ignore: cast_nullable_to_non_nullable
as String,tierLabel: null == tierLabel ? _self.tierLabel : tierLabel // ignore: cast_nullable_to_non_nullable
as String,phoneDisplay: null == phoneDisplay ? _self.phoneDisplay : phoneDisplay // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CounterRequestDto {

 String get code; int get points; num get discountMmk; String? get shopName; String? get expiresAt;
/// Create a copy of CounterRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CounterRequestDtoCopyWith<CounterRequestDto> get copyWith => _$CounterRequestDtoCopyWithImpl<CounterRequestDto>(this as CounterRequestDto, _$identity);

  /// Serializes this CounterRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CounterRequestDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterRequestDto&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.points, _this.points) || other.points == _this.points)&&(identical(other.discountMmk, _this.discountMmk) || other.discountMmk == _this.discountMmk)&&(identical(other.shopName, _this.shopName) || other.shopName == _this.shopName)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CounterRequestDto;
  return Object.hash(runtimeType,_this.code,_this.points,_this.discountMmk,_this.shopName,_this.expiresAt);
}

@override
String toString() {
  final _this = this as CounterRequestDto;
  return 'CounterRequestDto(code: ${_this.code}, points: ${_this.points}, discountMmk: ${_this.discountMmk}, shopName: ${_this.shopName}, expiresAt: ${_this.expiresAt})';
}


}

/// @nodoc
abstract mixin class $CounterRequestDtoCopyWith<$Res>  {
  factory $CounterRequestDtoCopyWith(CounterRequestDto value, $Res Function(CounterRequestDto) _then) = _$CounterRequestDtoCopyWithImpl;
@useResult
$Res call({
 String code, int points, num discountMmk, String? shopName, String? expiresAt
});




}
/// @nodoc
class _$CounterRequestDtoCopyWithImpl<$Res>
    implements $CounterRequestDtoCopyWith<$Res> {
  _$CounterRequestDtoCopyWithImpl(this._self, this._then);

  final CounterRequestDto _self;
  final $Res Function(CounterRequestDto) _then;

/// Create a copy of CounterRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? points = null,Object? discountMmk = null,Object? shopName = freezed,Object? expiresAt = freezed,}) {
  return _then(CounterRequestDto(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,discountMmk: null == discountMmk ? _self.discountMmk : discountMmk // ignore: cast_nullable_to_non_nullable
as num,shopName: freezed == shopName ? _self.shopName : shopName // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CounterRequestDto].
extension CounterRequestDtoPatterns on CounterRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CounterRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CounterRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CounterRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _CounterRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CounterRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _CounterRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  int points,  num discountMmk,  String? shopName,  String? expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CounterRequestDto() when $default != null:
return $default(_that.code,_that.points,_that.discountMmk,_that.shopName,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  int points,  num discountMmk,  String? shopName,  String? expiresAt)  $default,) {final _that = this;
switch (_that) {
case _CounterRequestDto():
return $default(_that.code,_that.points,_that.discountMmk,_that.shopName,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  int points,  num discountMmk,  String? shopName,  String? expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _CounterRequestDto() when $default != null:
return $default(_that.code,_that.points,_that.discountMmk,_that.shopName,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CounterRequestDto implements CounterRequestDto {
  const _CounterRequestDto({required this.code, required this.points, required this.discountMmk, this.shopName, this.expiresAt});
  factory _CounterRequestDto.fromJson(Map<String, dynamic> json) => _$CounterRequestDtoFromJson(json);

@override final  String code;
@override final  int points;
@override final  num discountMmk;
@override final  String? shopName;
@override final  String? expiresAt;

/// Create a copy of CounterRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CounterRequestDtoCopyWith<_CounterRequestDto> get copyWith => __$CounterRequestDtoCopyWithImpl<_CounterRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CounterRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CounterRequestDto&&(identical(other.code, code) || other.code == code)&&(identical(other.points, points) || other.points == points)&&(identical(other.discountMmk, discountMmk) || other.discountMmk == discountMmk)&&(identical(other.shopName, shopName) || other.shopName == shopName)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,code,points,discountMmk,shopName,expiresAt);
}

@override
String toString() {
    return 'CounterRequestDto(code: $code, points: $points, discountMmk: $discountMmk, shopName: $shopName, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$CounterRequestDtoCopyWith<$Res> implements $CounterRequestDtoCopyWith<$Res> {
  factory _$CounterRequestDtoCopyWith(_CounterRequestDto value, $Res Function(_CounterRequestDto) _then) = __$CounterRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String code, int points, num discountMmk, String? shopName, String? expiresAt
});




}
/// @nodoc
class __$CounterRequestDtoCopyWithImpl<$Res>
    implements _$CounterRequestDtoCopyWith<$Res> {
  __$CounterRequestDtoCopyWithImpl(this._self, this._then);

  final _CounterRequestDto _self;
  final $Res Function(_CounterRequestDto) _then;

/// Create a copy of CounterRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? points = null,Object? discountMmk = null,Object? shopName = freezed,Object? expiresAt = freezed,}) {
  return _then(_CounterRequestDto(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,discountMmk: null == discountMmk ? _self.discountMmk : discountMmk // ignore: cast_nullable_to_non_nullable
as num,shopName: freezed == shopName ? _self.shopName : shopName // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CounterResultDto {

 int get pointsUsed; num get discountMmk; String? get invoiceNo; int get balance;
/// Create a copy of CounterResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CounterResultDtoCopyWith<CounterResultDto> get copyWith => _$CounterResultDtoCopyWithImpl<CounterResultDto>(this as CounterResultDto, _$identity);

  /// Serializes this CounterResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CounterResultDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterResultDto&&(identical(other.pointsUsed, _this.pointsUsed) || other.pointsUsed == _this.pointsUsed)&&(identical(other.discountMmk, _this.discountMmk) || other.discountMmk == _this.discountMmk)&&(identical(other.invoiceNo, _this.invoiceNo) || other.invoiceNo == _this.invoiceNo)&&(identical(other.balance, _this.balance) || other.balance == _this.balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CounterResultDto;
  return Object.hash(runtimeType,_this.pointsUsed,_this.discountMmk,_this.invoiceNo,_this.balance);
}

@override
String toString() {
  final _this = this as CounterResultDto;
  return 'CounterResultDto(pointsUsed: ${_this.pointsUsed}, discountMmk: ${_this.discountMmk}, invoiceNo: ${_this.invoiceNo}, balance: ${_this.balance})';
}


}

/// @nodoc
abstract mixin class $CounterResultDtoCopyWith<$Res>  {
  factory $CounterResultDtoCopyWith(CounterResultDto value, $Res Function(CounterResultDto) _then) = _$CounterResultDtoCopyWithImpl;
@useResult
$Res call({
 int pointsUsed, num discountMmk, String? invoiceNo, int balance
});




}
/// @nodoc
class _$CounterResultDtoCopyWithImpl<$Res>
    implements $CounterResultDtoCopyWith<$Res> {
  _$CounterResultDtoCopyWithImpl(this._self, this._then);

  final CounterResultDto _self;
  final $Res Function(CounterResultDto) _then;

/// Create a copy of CounterResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pointsUsed = null,Object? discountMmk = null,Object? invoiceNo = freezed,Object? balance = null,}) {
  return _then(CounterResultDto(
pointsUsed: null == pointsUsed ? _self.pointsUsed : pointsUsed // ignore: cast_nullable_to_non_nullable
as int,discountMmk: null == discountMmk ? _self.discountMmk : discountMmk // ignore: cast_nullable_to_non_nullable
as num,invoiceNo: freezed == invoiceNo ? _self.invoiceNo : invoiceNo // ignore: cast_nullable_to_non_nullable
as String?,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CounterResultDto].
extension CounterResultDtoPatterns on CounterResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CounterResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CounterResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CounterResultDto value)  $default,){
final _that = this;
switch (_that) {
case _CounterResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CounterResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _CounterResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int pointsUsed,  num discountMmk,  String? invoiceNo,  int balance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CounterResultDto() when $default != null:
return $default(_that.pointsUsed,_that.discountMmk,_that.invoiceNo,_that.balance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int pointsUsed,  num discountMmk,  String? invoiceNo,  int balance)  $default,) {final _that = this;
switch (_that) {
case _CounterResultDto():
return $default(_that.pointsUsed,_that.discountMmk,_that.invoiceNo,_that.balance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int pointsUsed,  num discountMmk,  String? invoiceNo,  int balance)?  $default,) {final _that = this;
switch (_that) {
case _CounterResultDto() when $default != null:
return $default(_that.pointsUsed,_that.discountMmk,_that.invoiceNo,_that.balance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CounterResultDto implements CounterResultDto {
  const _CounterResultDto({required this.pointsUsed, required this.discountMmk, this.invoiceNo, required this.balance});
  factory _CounterResultDto.fromJson(Map<String, dynamic> json) => _$CounterResultDtoFromJson(json);

@override final  int pointsUsed;
@override final  num discountMmk;
@override final  String? invoiceNo;
@override final  int balance;

/// Create a copy of CounterResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CounterResultDtoCopyWith<_CounterResultDto> get copyWith => __$CounterResultDtoCopyWithImpl<_CounterResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CounterResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CounterResultDto&&(identical(other.pointsUsed, pointsUsed) || other.pointsUsed == pointsUsed)&&(identical(other.discountMmk, discountMmk) || other.discountMmk == discountMmk)&&(identical(other.invoiceNo, invoiceNo) || other.invoiceNo == invoiceNo)&&(identical(other.balance, balance) || other.balance == balance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,pointsUsed,discountMmk,invoiceNo,balance);
}

@override
String toString() {
    return 'CounterResultDto(pointsUsed: $pointsUsed, discountMmk: $discountMmk, invoiceNo: $invoiceNo, balance: $balance)';
}


}

/// @nodoc
abstract mixin class _$CounterResultDtoCopyWith<$Res> implements $CounterResultDtoCopyWith<$Res> {
  factory _$CounterResultDtoCopyWith(_CounterResultDto value, $Res Function(_CounterResultDto) _then) = __$CounterResultDtoCopyWithImpl;
@override @useResult
$Res call({
 int pointsUsed, num discountMmk, String? invoiceNo, int balance
});




}
/// @nodoc
class __$CounterResultDtoCopyWithImpl<$Res>
    implements _$CounterResultDtoCopyWith<$Res> {
  __$CounterResultDtoCopyWithImpl(this._self, this._then);

  final _CounterResultDto _self;
  final $Res Function(_CounterResultDto) _then;

/// Create a copy of CounterResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pointsUsed = null,Object? discountMmk = null,Object? invoiceNo = freezed,Object? balance = null,}) {
  return _then(_CounterResultDto(
pointsUsed: null == pointsUsed ? _self.pointsUsed : pointsUsed // ignore: cast_nullable_to_non_nullable
as int,discountMmk: null == discountMmk ? _self.discountMmk : discountMmk // ignore: cast_nullable_to_non_nullable
as num,invoiceNo: freezed == invoiceNo ? _self.invoiceNo : invoiceNo // ignore: cast_nullable_to_non_nullable
as String?,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
