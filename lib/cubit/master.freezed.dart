// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'master.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MasterKeyState {

 MasterKey? get key; RecoveredKey? get rkey; String? get error; String? get network;
/// Create a copy of MasterKeyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MasterKeyStateCopyWith<MasterKeyState> get copyWith => _$MasterKeyStateCopyWithImpl<MasterKeyState>(this as MasterKeyState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MasterKeyState&&(identical(other.key, key) || other.key == key)&&(identical(other.rkey, rkey) || other.rkey == rkey)&&(identical(other.error, error) || other.error == error)&&(identical(other.network, network) || other.network == network));
}


@override
int get hashCode => Object.hash(runtimeType,key,rkey,error,network);

@override
String toString() {
  return 'MasterKeyState(key: $key, rkey: $rkey, error: $error, network: $network)';
}


}

/// @nodoc
abstract mixin class $MasterKeyStateCopyWith<$Res>  {
  factory $MasterKeyStateCopyWith(MasterKeyState value, $Res Function(MasterKeyState) _then) = _$MasterKeyStateCopyWithImpl;
@useResult
$Res call({
 MasterKey? key, RecoveredKey? rkey, String? error, String? network
});


$MasterKeyCopyWith<$Res>? get key;$RecoveredKeyCopyWith<$Res>? get rkey;

}
/// @nodoc
class _$MasterKeyStateCopyWithImpl<$Res>
    implements $MasterKeyStateCopyWith<$Res> {
  _$MasterKeyStateCopyWithImpl(this._self, this._then);

  final MasterKeyState _self;
  final $Res Function(MasterKeyState) _then;

/// Create a copy of MasterKeyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = freezed,Object? rkey = freezed,Object? error = freezed,Object? network = freezed,}) {
  return _then(_self.copyWith(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as MasterKey?,rkey: freezed == rkey ? _self.rkey : rkey // ignore: cast_nullable_to_non_nullable
as RecoveredKey?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,network: freezed == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of MasterKeyState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MasterKeyCopyWith<$Res>? get key {
    if (_self.key == null) {
    return null;
  }

  return $MasterKeyCopyWith<$Res>(_self.key!, (value) {
    return _then(_self.copyWith(key: value));
  });
}/// Create a copy of MasterKeyState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecoveredKeyCopyWith<$Res>? get rkey {
    if (_self.rkey == null) {
    return null;
  }

  return $RecoveredKeyCopyWith<$Res>(_self.rkey!, (value) {
    return _then(_self.copyWith(rkey: value));
  });
}
}


/// Adds pattern-matching-related methods to [MasterKeyState].
extension MasterKeyStatePatterns on MasterKeyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MasterKeyState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MasterKeyState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MasterKeyState value)  $default,){
final _that = this;
switch (_that) {
case _MasterKeyState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MasterKeyState value)?  $default,){
final _that = this;
switch (_that) {
case _MasterKeyState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MasterKey? key,  RecoveredKey? rkey,  String? error,  String? network)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MasterKeyState() when $default != null:
return $default(_that.key,_that.rkey,_that.error,_that.network);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MasterKey? key,  RecoveredKey? rkey,  String? error,  String? network)  $default,) {final _that = this;
switch (_that) {
case _MasterKeyState():
return $default(_that.key,_that.rkey,_that.error,_that.network);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MasterKey? key,  RecoveredKey? rkey,  String? error,  String? network)?  $default,) {final _that = this;
switch (_that) {
case _MasterKeyState() when $default != null:
return $default(_that.key,_that.rkey,_that.error,_that.network);case _:
  return null;

}
}

}

/// @nodoc


class _MasterKeyState extends MasterKeyState {
  const _MasterKeyState({this.key, this.rkey, this.error, this.network}): super._();
  

@override final  MasterKey? key;
@override final  RecoveredKey? rkey;
@override final  String? error;
@override final  String? network;

/// Create a copy of MasterKeyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MasterKeyStateCopyWith<_MasterKeyState> get copyWith => __$MasterKeyStateCopyWithImpl<_MasterKeyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MasterKeyState&&(identical(other.key, key) || other.key == key)&&(identical(other.rkey, rkey) || other.rkey == rkey)&&(identical(other.error, error) || other.error == error)&&(identical(other.network, network) || other.network == network));
}


@override
int get hashCode => Object.hash(runtimeType,key,rkey,error,network);

@override
String toString() {
  return 'MasterKeyState(key: $key, rkey: $rkey, error: $error, network: $network)';
}


}

/// @nodoc
abstract mixin class _$MasterKeyStateCopyWith<$Res> implements $MasterKeyStateCopyWith<$Res> {
  factory _$MasterKeyStateCopyWith(_MasterKeyState value, $Res Function(_MasterKeyState) _then) = __$MasterKeyStateCopyWithImpl;
@override @useResult
$Res call({
 MasterKey? key, RecoveredKey? rkey, String? error, String? network
});


@override $MasterKeyCopyWith<$Res>? get key;@override $RecoveredKeyCopyWith<$Res>? get rkey;

}
/// @nodoc
class __$MasterKeyStateCopyWithImpl<$Res>
    implements _$MasterKeyStateCopyWith<$Res> {
  __$MasterKeyStateCopyWithImpl(this._self, this._then);

  final _MasterKeyState _self;
  final $Res Function(_MasterKeyState) _then;

/// Create a copy of MasterKeyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = freezed,Object? rkey = freezed,Object? error = freezed,Object? network = freezed,}) {
  return _then(_MasterKeyState(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as MasterKey?,rkey: freezed == rkey ? _self.rkey : rkey // ignore: cast_nullable_to_non_nullable
as RecoveredKey?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,network: freezed == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of MasterKeyState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MasterKeyCopyWith<$Res>? get key {
    if (_self.key == null) {
    return null;
  }

  return $MasterKeyCopyWith<$Res>(_self.key!, (value) {
    return _then(_self.copyWith(key: value));
  });
}/// Create a copy of MasterKeyState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecoveredKeyCopyWith<$Res>? get rkey {
    if (_self.rkey == null) {
    return null;
  }

  return $RecoveredKeyCopyWith<$Res>(_self.rkey!, (value) {
    return _then(_self.copyWith(rkey: value));
  });
}
}

// dart format on
