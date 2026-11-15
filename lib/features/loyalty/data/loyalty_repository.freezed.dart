// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoyaltySummaryDto {

 int get points; int get earnedThisMonth; int? get expiringPoints; String? get expiringOn; num get equivalentMmk; String get tier; String get tierLabel; int get clubScore; String? get nextTier; String? get nextTierLabel; int? get nextTierThreshold; int get progressPercent; int? get dailyRedeemLimit; num get earnRatePer100Ks;
/// Create a copy of LoyaltySummaryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoyaltySummaryDtoCopyWith<LoyaltySummaryDto> get copyWith => _$LoyaltySummaryDtoCopyWithImpl<LoyaltySummaryDto>(this as LoyaltySummaryDto, _$identity);

  /// Serializes this LoyaltySummaryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LoyaltySummaryDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoyaltySummaryDto&&(identical(other.points, _this.points) || other.points == _this.points)&&(identical(other.earnedThisMonth, _this.earnedThisMonth) || other.earnedThisMonth == _this.earnedThisMonth)&&(identical(other.expiringPoints, _this.expiringPoints) || other.expiringPoints == _this.expiringPoints)&&(identical(other.expiringOn, _this.expiringOn) || other.expiringOn == _this.expiringOn)&&(identical(other.equivalentMmk, _this.equivalentMmk) || other.equivalentMmk == _this.equivalentMmk)&&(identical(other.tier, _this.tier) || other.tier == _this.tier)&&(identical(other.tierLabel, _this.tierLabel) || other.tierLabel == _this.tierLabel)&&(identical(other.clubScore, _this.clubScore) || other.clubScore == _this.clubScore)&&(identical(other.nextTier, _this.nextTier) || other.nextTier == _this.nextTier)&&(identical(other.nextTierLabel, _this.nextTierLabel) || other.nextTierLabel == _this.nextTierLabel)&&(identical(other.nextTierThreshold, _this.nextTierThreshold) || other.nextTierThreshold == _this.nextTierThreshold)&&(identical(other.progressPercent, _this.progressPercent) || other.progressPercent == _this.progressPercent)&&(identical(other.dailyRedeemLimit, _this.dailyRedeemLimit) || other.dailyRedeemLimit == _this.dailyRedeemLimit)&&(identical(other.earnRatePer100Ks, _this.earnRatePer100Ks) || other.earnRatePer100Ks == _this.earnRatePer100Ks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LoyaltySummaryDto;
  return Object.hash(runtimeType,_this.points,_this.earnedThisMonth,_this.expiringPoints,_this.expiringOn,_this.equivalentMmk,_this.tier,_this.tierLabel,_this.clubScore,_this.nextTier,_this.nextTierLabel,_this.nextTierThreshold,_this.progressPercent,_this.dailyRedeemLimit,_this.earnRatePer100Ks);
}

@override
String toString() {
  final _this = this as LoyaltySummaryDto;
  return 'LoyaltySummaryDto(points: ${_this.points}, earnedThisMonth: ${_this.earnedThisMonth}, expiringPoints: ${_this.expiringPoints}, expiringOn: ${_this.expiringOn}, equivalentMmk: ${_this.equivalentMmk}, tier: ${_this.tier}, tierLabel: ${_this.tierLabel}, clubScore: ${_this.clubScore}, nextTier: ${_this.nextTier}, nextTierLabel: ${_this.nextTierLabel}, nextTierThreshold: ${_this.nextTierThreshold}, progressPercent: ${_this.progressPercent}, dailyRedeemLimit: ${_this.dailyRedeemLimit}, earnRatePer100Ks: ${_this.earnRatePer100Ks})';
}


}

/// @nodoc
abstract mixin class $LoyaltySummaryDtoCopyWith<$Res>  {
  factory $LoyaltySummaryDtoCopyWith(LoyaltySummaryDto value, $Res Function(LoyaltySummaryDto) _then) = _$LoyaltySummaryDtoCopyWithImpl;
@useResult
$Res call({
 int points, int earnedThisMonth, int? expiringPoints, String? expiringOn, num equivalentMmk, String tier, String tierLabel, int clubScore, String? nextTier, String? nextTierLabel, int? nextTierThreshold, int progressPercent, int? dailyRedeemLimit, num earnRatePer100Ks
});




}
/// @nodoc
class _$LoyaltySummaryDtoCopyWithImpl<$Res>
    implements $LoyaltySummaryDtoCopyWith<$Res> {
  _$LoyaltySummaryDtoCopyWithImpl(this._self, this._then);

  final LoyaltySummaryDto _self;
  final $Res Function(LoyaltySummaryDto) _then;

/// Create a copy of LoyaltySummaryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,Object? earnedThisMonth = null,Object? expiringPoints = freezed,Object? expiringOn = freezed,Object? equivalentMmk = null,Object? tier = null,Object? tierLabel = null,Object? clubScore = null,Object? nextTier = freezed,Object? nextTierLabel = freezed,Object? nextTierThreshold = freezed,Object? progressPercent = null,Object? dailyRedeemLimit = freezed,Object? earnRatePer100Ks = null,}) {
  return _then(LoyaltySummaryDto(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,earnedThisMonth: null == earnedThisMonth ? _self.earnedThisMonth : earnedThisMonth // ignore: cast_nullable_to_non_nullable
as int,expiringPoints: freezed == expiringPoints ? _self.expiringPoints : expiringPoints // ignore: cast_nullable_to_non_nullable
as int?,expiringOn: freezed == expiringOn ? _self.expiringOn : expiringOn // ignore: cast_nullable_to_non_nullable
as String?,equivalentMmk: null == equivalentMmk ? _self.equivalentMmk : equivalentMmk // ignore: cast_nullable_to_non_nullable
as num,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,tierLabel: null == tierLabel ? _self.tierLabel : tierLabel // ignore: cast_nullable_to_non_nullable
as String,clubScore: null == clubScore ? _self.clubScore : clubScore // ignore: cast_nullable_to_non_nullable
as int,nextTier: freezed == nextTier ? _self.nextTier : nextTier // ignore: cast_nullable_to_non_nullable
as String?,nextTierLabel: freezed == nextTierLabel ? _self.nextTierLabel : nextTierLabel // ignore: cast_nullable_to_non_nullable
as String?,nextTierThreshold: freezed == nextTierThreshold ? _self.nextTierThreshold : nextTierThreshold // ignore: cast_nullable_to_non_nullable
as int?,progressPercent: null == progressPercent ? _self.progressPercent : progressPercent // ignore: cast_nullable_to_non_nullable
as int,dailyRedeemLimit: freezed == dailyRedeemLimit ? _self.dailyRedeemLimit : dailyRedeemLimit // ignore: cast_nullable_to_non_nullable
as int?,earnRatePer100Ks: null == earnRatePer100Ks ? _self.earnRatePer100Ks : earnRatePer100Ks // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [LoyaltySummaryDto].
extension LoyaltySummaryDtoPatterns on LoyaltySummaryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoyaltySummaryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoyaltySummaryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoyaltySummaryDto value)  $default,){
final _that = this;
switch (_that) {
case _LoyaltySummaryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoyaltySummaryDto value)?  $default,){
final _that = this;
switch (_that) {
case _LoyaltySummaryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int points,  int earnedThisMonth,  int? expiringPoints,  String? expiringOn,  num equivalentMmk,  String tier,  String tierLabel,  int clubScore,  String? nextTier,  String? nextTierLabel,  int? nextTierThreshold,  int progressPercent,  int? dailyRedeemLimit,  num earnRatePer100Ks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoyaltySummaryDto() when $default != null:
return $default(_that.points,_that.earnedThisMonth,_that.expiringPoints,_that.expiringOn,_that.equivalentMmk,_that.tier,_that.tierLabel,_that.clubScore,_that.nextTier,_that.nextTierLabel,_that.nextTierThreshold,_that.progressPercent,_that.dailyRedeemLimit,_that.earnRatePer100Ks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int points,  int earnedThisMonth,  int? expiringPoints,  String? expiringOn,  num equivalentMmk,  String tier,  String tierLabel,  int clubScore,  String? nextTier,  String? nextTierLabel,  int? nextTierThreshold,  int progressPercent,  int? dailyRedeemLimit,  num earnRatePer100Ks)  $default,) {final _that = this;
switch (_that) {
case _LoyaltySummaryDto():
return $default(_that.points,_that.earnedThisMonth,_that.expiringPoints,_that.expiringOn,_that.equivalentMmk,_that.tier,_that.tierLabel,_that.clubScore,_that.nextTier,_that.nextTierLabel,_that.nextTierThreshold,_that.progressPercent,_that.dailyRedeemLimit,_that.earnRatePer100Ks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int points,  int earnedThisMonth,  int? expiringPoints,  String? expiringOn,  num equivalentMmk,  String tier,  String tierLabel,  int clubScore,  String? nextTier,  String? nextTierLabel,  int? nextTierThreshold,  int progressPercent,  int? dailyRedeemLimit,  num earnRatePer100Ks)?  $default,) {final _that = this;
switch (_that) {
case _LoyaltySummaryDto() when $default != null:
return $default(_that.points,_that.earnedThisMonth,_that.expiringPoints,_that.expiringOn,_that.equivalentMmk,_that.tier,_that.tierLabel,_that.clubScore,_that.nextTier,_that.nextTierLabel,_that.nextTierThreshold,_that.progressPercent,_that.dailyRedeemLimit,_that.earnRatePer100Ks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoyaltySummaryDto implements LoyaltySummaryDto {
  const _LoyaltySummaryDto({required this.points, this.earnedThisMonth = 0, this.expiringPoints, this.expiringOn, required this.equivalentMmk, required this.tier, required this.tierLabel, required this.clubScore, this.nextTier, this.nextTierLabel, this.nextTierThreshold, this.progressPercent = 0, this.dailyRedeemLimit, required this.earnRatePer100Ks});
  factory _LoyaltySummaryDto.fromJson(Map<String, dynamic> json) => _$LoyaltySummaryDtoFromJson(json);

@override final  int points;
@override@JsonKey() final  int earnedThisMonth;
@override final  int? expiringPoints;
@override final  String? expiringOn;
@override final  num equivalentMmk;
@override final  String tier;
@override final  String tierLabel;
@override final  int clubScore;
@override final  String? nextTier;
@override final  String? nextTierLabel;
@override final  int? nextTierThreshold;
@override@JsonKey() final  int progressPercent;
@override final  int? dailyRedeemLimit;
@override final  num earnRatePer100Ks;

/// Create a copy of LoyaltySummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoyaltySummaryDtoCopyWith<_LoyaltySummaryDto> get copyWith => __$LoyaltySummaryDtoCopyWithImpl<_LoyaltySummaryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoyaltySummaryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoyaltySummaryDto&&(identical(other.points, points) || other.points == points)&&(identical(other.earnedThisMonth, earnedThisMonth) || other.earnedThisMonth == earnedThisMonth)&&(identical(other.expiringPoints, expiringPoints) || other.expiringPoints == expiringPoints)&&(identical(other.expiringOn, expiringOn) || other.expiringOn == expiringOn)&&(identical(other.equivalentMmk, equivalentMmk) || other.equivalentMmk == equivalentMmk)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.tierLabel, tierLabel) || other.tierLabel == tierLabel)&&(identical(other.clubScore, clubScore) || other.clubScore == clubScore)&&(identical(other.nextTier, nextTier) || other.nextTier == nextTier)&&(identical(other.nextTierLabel, nextTierLabel) || other.nextTierLabel == nextTierLabel)&&(identical(other.nextTierThreshold, nextTierThreshold) || other.nextTierThreshold == nextTierThreshold)&&(identical(other.progressPercent, progressPercent) || other.progressPercent == progressPercent)&&(identical(other.dailyRedeemLimit, dailyRedeemLimit) || other.dailyRedeemLimit == dailyRedeemLimit)&&(identical(other.earnRatePer100Ks, earnRatePer100Ks) || other.earnRatePer100Ks == earnRatePer100Ks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,points,earnedThisMonth,expiringPoints,expiringOn,equivalentMmk,tier,tierLabel,clubScore,nextTier,nextTierLabel,nextTierThreshold,progressPercent,dailyRedeemLimit,earnRatePer100Ks);
}

@override
String toString() {
    return 'LoyaltySummaryDto(points: $points, earnedThisMonth: $earnedThisMonth, expiringPoints: $expiringPoints, expiringOn: $expiringOn, equivalentMmk: $equivalentMmk, tier: $tier, tierLabel: $tierLabel, clubScore: $clubScore, nextTier: $nextTier, nextTierLabel: $nextTierLabel, nextTierThreshold: $nextTierThreshold, progressPercent: $progressPercent, dailyRedeemLimit: $dailyRedeemLimit, earnRatePer100Ks: $earnRatePer100Ks)';
}


}

/// @nodoc
abstract mixin class _$LoyaltySummaryDtoCopyWith<$Res> implements $LoyaltySummaryDtoCopyWith<$Res> {
  factory _$LoyaltySummaryDtoCopyWith(_LoyaltySummaryDto value, $Res Function(_LoyaltySummaryDto) _then) = __$LoyaltySummaryDtoCopyWithImpl;
@override @useResult
$Res call({
 int points, int earnedThisMonth, int? expiringPoints, String? expiringOn, num equivalentMmk, String tier, String tierLabel, int clubScore, String? nextTier, String? nextTierLabel, int? nextTierThreshold, int progressPercent, int? dailyRedeemLimit, num earnRatePer100Ks
});




}
/// @nodoc
class __$LoyaltySummaryDtoCopyWithImpl<$Res>
    implements _$LoyaltySummaryDtoCopyWith<$Res> {
  __$LoyaltySummaryDtoCopyWithImpl(this._self, this._then);

  final _LoyaltySummaryDto _self;
  final $Res Function(_LoyaltySummaryDto) _then;

/// Create a copy of LoyaltySummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,Object? earnedThisMonth = null,Object? expiringPoints = freezed,Object? expiringOn = freezed,Object? equivalentMmk = null,Object? tier = null,Object? tierLabel = null,Object? clubScore = null,Object? nextTier = freezed,Object? nextTierLabel = freezed,Object? nextTierThreshold = freezed,Object? progressPercent = null,Object? dailyRedeemLimit = freezed,Object? earnRatePer100Ks = null,}) {
  return _then(_LoyaltySummaryDto(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,earnedThisMonth: null == earnedThisMonth ? _self.earnedThisMonth : earnedThisMonth // ignore: cast_nullable_to_non_nullable
as int,expiringPoints: freezed == expiringPoints ? _self.expiringPoints : expiringPoints // ignore: cast_nullable_to_non_nullable
as int?,expiringOn: freezed == expiringOn ? _self.expiringOn : expiringOn // ignore: cast_nullable_to_non_nullable
as String?,equivalentMmk: null == equivalentMmk ? _self.equivalentMmk : equivalentMmk // ignore: cast_nullable_to_non_nullable
as num,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,tierLabel: null == tierLabel ? _self.tierLabel : tierLabel // ignore: cast_nullable_to_non_nullable
as String,clubScore: null == clubScore ? _self.clubScore : clubScore // ignore: cast_nullable_to_non_nullable
as int,nextTier: freezed == nextTier ? _self.nextTier : nextTier // ignore: cast_nullable_to_non_nullable
as String?,nextTierLabel: freezed == nextTierLabel ? _self.nextTierLabel : nextTierLabel // ignore: cast_nullable_to_non_nullable
as String?,nextTierThreshold: freezed == nextTierThreshold ? _self.nextTierThreshold : nextTierThreshold // ignore: cast_nullable_to_non_nullable
as int?,progressPercent: null == progressPercent ? _self.progressPercent : progressPercent // ignore: cast_nullable_to_non_nullable
as int,dailyRedeemLimit: freezed == dailyRedeemLimit ? _self.dailyRedeemLimit : dailyRedeemLimit // ignore: cast_nullable_to_non_nullable
as int?,earnRatePer100Ks: null == earnRatePer100Ks ? _self.earnRatePer100Ks : earnRatePer100Ks // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}

// dart format on
