// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Pin {

@HiveField(0) String get value;@HiveField(1) int get attemptsLeft;@HiveField(2) int get lastFailure;@HiveField(3) bool get isLocked;
/// Create a copy of Pin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PinCopyWith<Pin> get copyWith => _$PinCopyWithImpl<Pin>(this as Pin, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pin&&(identical(other.value, value) || other.value == value)&&(identical(other.attemptsLeft, attemptsLeft) || other.attemptsLeft == attemptsLeft)&&(identical(other.lastFailure, lastFailure) || other.lastFailure == lastFailure)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked));
}


@override
int get hashCode => Object.hash(runtimeType,value,attemptsLeft,lastFailure,isLocked);

@override
String toString() {
  return 'Pin(value: $value, attemptsLeft: $attemptsLeft, lastFailure: $lastFailure, isLocked: $isLocked)';
}


}

/// @nodoc
abstract mixin class $PinCopyWith<$Res>  {
  factory $PinCopyWith(Pin value, $Res Function(Pin) _then) = _$PinCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String value,@HiveField(1) int attemptsLeft,@HiveField(2) int lastFailure,@HiveField(3) bool isLocked
});




}
/// @nodoc
class _$PinCopyWithImpl<$Res>
    implements $PinCopyWith<$Res> {
  _$PinCopyWithImpl(this._self, this._then);

  final Pin _self;
  final $Res Function(Pin) _then;

/// Create a copy of Pin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? attemptsLeft = null,Object? lastFailure = null,Object? isLocked = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,attemptsLeft: null == attemptsLeft ? _self.attemptsLeft : attemptsLeft // ignore: cast_nullable_to_non_nullable
as int,lastFailure: null == lastFailure ? _self.lastFailure : lastFailure // ignore: cast_nullable_to_non_nullable
as int,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Pin].
extension PinPatterns on Pin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Pin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Pin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Pin value)  $default,){
final _that = this;
switch (_that) {
case _Pin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Pin value)?  $default,){
final _that = this;
switch (_that) {
case _Pin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String value, @HiveField(1)  int attemptsLeft, @HiveField(2)  int lastFailure, @HiveField(3)  bool isLocked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Pin() when $default != null:
return $default(_that.value,_that.attemptsLeft,_that.lastFailure,_that.isLocked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String value, @HiveField(1)  int attemptsLeft, @HiveField(2)  int lastFailure, @HiveField(3)  bool isLocked)  $default,) {final _that = this;
switch (_that) {
case _Pin():
return $default(_that.value,_that.attemptsLeft,_that.lastFailure,_that.isLocked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String value, @HiveField(1)  int attemptsLeft, @HiveField(2)  int lastFailure, @HiveField(3)  bool isLocked)?  $default,) {final _that = this;
switch (_that) {
case _Pin() when $default != null:
return $default(_that.value,_that.attemptsLeft,_that.lastFailure,_that.isLocked);case _:
  return null;

}
}

}

/// @nodoc

@HiveType(typeId: 9, adapterName: 'PinClassAdapter')
class _Pin extends Pin {
  const _Pin({@HiveField(0) required this.value, @HiveField(1) required this.attemptsLeft, @HiveField(2) required this.lastFailure, @HiveField(3) required this.isLocked}): super._();
  

@override@HiveField(0) final  String value;
@override@HiveField(1) final  int attemptsLeft;
@override@HiveField(2) final  int lastFailure;
@override@HiveField(3) final  bool isLocked;

/// Create a copy of Pin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PinCopyWith<_Pin> get copyWith => __$PinCopyWithImpl<_Pin>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pin&&(identical(other.value, value) || other.value == value)&&(identical(other.attemptsLeft, attemptsLeft) || other.attemptsLeft == attemptsLeft)&&(identical(other.lastFailure, lastFailure) || other.lastFailure == lastFailure)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked));
}


@override
int get hashCode => Object.hash(runtimeType,value,attemptsLeft,lastFailure,isLocked);

@override
String toString() {
  return 'Pin(value: $value, attemptsLeft: $attemptsLeft, lastFailure: $lastFailure, isLocked: $isLocked)';
}


}

/// @nodoc
abstract mixin class _$PinCopyWith<$Res> implements $PinCopyWith<$Res> {
  factory _$PinCopyWith(_Pin value, $Res Function(_Pin) _then) = __$PinCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String value,@HiveField(1) int attemptsLeft,@HiveField(2) int lastFailure,@HiveField(3) bool isLocked
});




}
/// @nodoc
class __$PinCopyWithImpl<$Res>
    implements _$PinCopyWith<$Res> {
  __$PinCopyWithImpl(this._self, this._then);

  final _Pin _self;
  final $Res Function(_Pin) _then;

/// Create a copy of Pin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? attemptsLeft = null,Object? lastFailure = null,Object? isLocked = null,}) {
  return _then(_Pin(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,attemptsLeft: null == attemptsLeft ? _self.attemptsLeft : attemptsLeft // ignore: cast_nullable_to_non_nullable
as int,lastFailure: null == lastFailure ? _self.lastFailure : lastFailure // ignore: cast_nullable_to_non_nullable
as int,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
