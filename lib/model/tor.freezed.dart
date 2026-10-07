// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Tor {

@HiveField(0) bool get enforced;@HiveField(1) bool get internal;@HiveField(2) int get externalPort;
/// Create a copy of Tor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TorCopyWith<Tor> get copyWith => _$TorCopyWithImpl<Tor>(this as Tor, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tor&&(identical(other.enforced, enforced) || other.enforced == enforced)&&(identical(other.internal, internal) || other.internal == internal)&&(identical(other.externalPort, externalPort) || other.externalPort == externalPort));
}


@override
int get hashCode => Object.hash(runtimeType,enforced,internal,externalPort);

@override
String toString() {
  return 'Tor(enforced: $enforced, internal: $internal, externalPort: $externalPort)';
}


}

/// @nodoc
abstract mixin class $TorCopyWith<$Res>  {
  factory $TorCopyWith(Tor value, $Res Function(Tor) _then) = _$TorCopyWithImpl;
@useResult
$Res call({
@HiveField(0) bool enforced,@HiveField(1) bool internal,@HiveField(2) int externalPort
});




}
/// @nodoc
class _$TorCopyWithImpl<$Res>
    implements $TorCopyWith<$Res> {
  _$TorCopyWithImpl(this._self, this._then);

  final Tor _self;
  final $Res Function(Tor) _then;

/// Create a copy of Tor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enforced = null,Object? internal = null,Object? externalPort = null,}) {
  return _then(_self.copyWith(
enforced: null == enforced ? _self.enforced : enforced // ignore: cast_nullable_to_non_nullable
as bool,internal: null == internal ? _self.internal : internal // ignore: cast_nullable_to_non_nullable
as bool,externalPort: null == externalPort ? _self.externalPort : externalPort // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Tor].
extension TorPatterns on Tor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tor value)  $default,){
final _that = this;
switch (_that) {
case _Tor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tor value)?  $default,){
final _that = this;
switch (_that) {
case _Tor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  bool enforced, @HiveField(1)  bool internal, @HiveField(2)  int externalPort)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tor() when $default != null:
return $default(_that.enforced,_that.internal,_that.externalPort);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  bool enforced, @HiveField(1)  bool internal, @HiveField(2)  int externalPort)  $default,) {final _that = this;
switch (_that) {
case _Tor():
return $default(_that.enforced,_that.internal,_that.externalPort);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  bool enforced, @HiveField(1)  bool internal, @HiveField(2)  int externalPort)?  $default,) {final _that = this;
switch (_that) {
case _Tor() when $default != null:
return $default(_that.enforced,_that.internal,_that.externalPort);case _:
  return null;

}
}

}

/// @nodoc

@HiveType(typeId: 8, adapterName: 'TorClassAdapter')
class _Tor extends Tor {
  const _Tor({@HiveField(0) required this.enforced, @HiveField(1) required this.internal, @HiveField(2) required this.externalPort}): super._();
  

@override@HiveField(0) final  bool enforced;
@override@HiveField(1) final  bool internal;
@override@HiveField(2) final  int externalPort;

/// Create a copy of Tor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TorCopyWith<_Tor> get copyWith => __$TorCopyWithImpl<_Tor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tor&&(identical(other.enforced, enforced) || other.enforced == enforced)&&(identical(other.internal, internal) || other.internal == internal)&&(identical(other.externalPort, externalPort) || other.externalPort == externalPort));
}


@override
int get hashCode => Object.hash(runtimeType,enforced,internal,externalPort);

@override
String toString() {
  return 'Tor(enforced: $enforced, internal: $internal, externalPort: $externalPort)';
}


}

/// @nodoc
abstract mixin class _$TorCopyWith<$Res> implements $TorCopyWith<$Res> {
  factory _$TorCopyWith(_Tor value, $Res Function(_Tor) _then) = __$TorCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) bool enforced,@HiveField(1) bool internal,@HiveField(2) int externalPort
});




}
/// @nodoc
class __$TorCopyWithImpl<$Res>
    implements _$TorCopyWith<$Res> {
  __$TorCopyWithImpl(this._self, this._then);

  final _Tor _self;
  final $Res Function(_Tor) _then;

/// Create a copy of Tor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enforced = null,Object? internal = null,Object? externalPort = null,}) {
  return _then(_Tor(
enforced: null == enforced ? _self.enforced : enforced // ignore: cast_nullable_to_non_nullable
as bool,internal: null == internal ? _self.internal : internal // ignore: cast_nullable_to_non_nullable
as bool,externalPort: null == externalPort ? _self.externalPort : externalPort // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
