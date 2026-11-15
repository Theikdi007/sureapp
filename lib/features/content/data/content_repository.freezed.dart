// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContentPageDto {

 String get slug; String get title; String get body; String? get updatedAt;
/// Create a copy of ContentPageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentPageDtoCopyWith<ContentPageDto> get copyWith => _$ContentPageDtoCopyWithImpl<ContentPageDto>(this as ContentPageDto, _$identity);

  /// Serializes this ContentPageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ContentPageDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentPageDto&&(identical(other.slug, _this.slug) || other.slug == _this.slug)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.body, _this.body) || other.body == _this.body)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ContentPageDto;
  return Object.hash(runtimeType,_this.slug,_this.title,_this.body,_this.updatedAt);
}

@override
String toString() {
  final _this = this as ContentPageDto;
  return 'ContentPageDto(slug: ${_this.slug}, title: ${_this.title}, body: ${_this.body}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $ContentPageDtoCopyWith<$Res>  {
  factory $ContentPageDtoCopyWith(ContentPageDto value, $Res Function(ContentPageDto) _then) = _$ContentPageDtoCopyWithImpl;
@useResult
$Res call({
 String slug, String title, String body, String? updatedAt
});




}
/// @nodoc
class _$ContentPageDtoCopyWithImpl<$Res>
    implements $ContentPageDtoCopyWith<$Res> {
  _$ContentPageDtoCopyWithImpl(this._self, this._then);

  final ContentPageDto _self;
  final $Res Function(ContentPageDto) _then;

/// Create a copy of ContentPageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slug = null,Object? title = null,Object? body = null,Object? updatedAt = freezed,}) {
  return _then(ContentPageDto(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContentPageDto].
extension ContentPageDtoPatterns on ContentPageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContentPageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContentPageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContentPageDto value)  $default,){
final _that = this;
switch (_that) {
case _ContentPageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContentPageDto value)?  $default,){
final _that = this;
switch (_that) {
case _ContentPageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String slug,  String title,  String body,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContentPageDto() when $default != null:
return $default(_that.slug,_that.title,_that.body,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String slug,  String title,  String body,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ContentPageDto():
return $default(_that.slug,_that.title,_that.body,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String slug,  String title,  String body,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ContentPageDto() when $default != null:
return $default(_that.slug,_that.title,_that.body,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContentPageDto implements ContentPageDto {
  const _ContentPageDto({required this.slug, required this.title, required this.body, this.updatedAt});
  factory _ContentPageDto.fromJson(Map<String, dynamic> json) => _$ContentPageDtoFromJson(json);

@override final  String slug;
@override final  String title;
@override final  String body;
@override final  String? updatedAt;

/// Create a copy of ContentPageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentPageDtoCopyWith<_ContentPageDto> get copyWith => __$ContentPageDtoCopyWithImpl<_ContentPageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContentPageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentPageDto&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,slug,title,body,updatedAt);
}

@override
String toString() {
    return 'ContentPageDto(slug: $slug, title: $title, body: $body, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ContentPageDtoCopyWith<$Res> implements $ContentPageDtoCopyWith<$Res> {
  factory _$ContentPageDtoCopyWith(_ContentPageDto value, $Res Function(_ContentPageDto) _then) = __$ContentPageDtoCopyWithImpl;
@override @useResult
$Res call({
 String slug, String title, String body, String? updatedAt
});




}
/// @nodoc
class __$ContentPageDtoCopyWithImpl<$Res>
    implements _$ContentPageDtoCopyWith<$Res> {
  __$ContentPageDtoCopyWithImpl(this._self, this._then);

  final _ContentPageDto _self;
  final $Res Function(_ContentPageDto) _then;

/// Create a copy of ContentPageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slug = null,Object? title = null,Object? body = null,Object? updatedAt = freezed,}) {
  return _then(_ContentPageDto(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
