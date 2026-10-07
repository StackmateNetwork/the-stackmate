// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recover.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecoveredKey {

 String? get seed; String? get root; String? get fingerprint; String? get network;
/// Create a copy of RecoveredKey
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecoveredKeyCopyWith<RecoveredKey> get copyWith => _$RecoveredKeyCopyWithImpl<RecoveredKey>(this as RecoveredKey, _$identity);

  /// Serializes this RecoveredKey to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecoveredKey&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.root, root) || other.root == root)&&(identical(other.fingerprint, fingerprint) || other.fingerprint == fingerprint)&&(identical(other.network, network) || other.network == network));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seed,root,fingerprint,network);

@override
String toString() {
  return 'RecoveredKey(seed: $seed, root: $root, fingerprint: $fingerprint, network: $network)';
}


}

/// @nodoc
abstract mixin class $RecoveredKeyCopyWith<$Res>  {
  factory $RecoveredKeyCopyWith(RecoveredKey value, $Res Function(RecoveredKey) _then) = _$RecoveredKeyCopyWithImpl;
@useResult
$Res call({
 String? seed, String? root, String? fingerprint, String? network
});




}
/// @nodoc
class _$RecoveredKeyCopyWithImpl<$Res>
    implements $RecoveredKeyCopyWith<$Res> {
  _$RecoveredKeyCopyWithImpl(this._self, this._then);

  final RecoveredKey _self;
  final $Res Function(RecoveredKey) _then;

/// Create a copy of RecoveredKey
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seed = freezed,Object? root = freezed,Object? fingerprint = freezed,Object? network = freezed,}) {
  return _then(_self.copyWith(
seed: freezed == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as String?,root: freezed == root ? _self.root : root // ignore: cast_nullable_to_non_nullable
as String?,fingerprint: freezed == fingerprint ? _self.fingerprint : fingerprint // ignore: cast_nullable_to_non_nullable
as String?,network: freezed == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecoveredKey].
extension RecoveredKeyPatterns on RecoveredKey {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecoveredKey value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecoveredKey() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecoveredKey value)  $default,){
final _that = this;
switch (_that) {
case _RecoveredKey():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecoveredKey value)?  $default,){
final _that = this;
switch (_that) {
case _RecoveredKey() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? seed,  String? root,  String? fingerprint,  String? network)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecoveredKey() when $default != null:
return $default(_that.seed,_that.root,_that.fingerprint,_that.network);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? seed,  String? root,  String? fingerprint,  String? network)  $default,) {final _that = this;
switch (_that) {
case _RecoveredKey():
return $default(_that.seed,_that.root,_that.fingerprint,_that.network);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? seed,  String? root,  String? fingerprint,  String? network)?  $default,) {final _that = this;
switch (_that) {
case _RecoveredKey() when $default != null:
return $default(_that.seed,_that.root,_that.fingerprint,_that.network);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecoveredKey implements RecoveredKey {
  const _RecoveredKey({this.seed, this.root, this.fingerprint, this.network});
  factory _RecoveredKey.fromJson(Map<String, dynamic> json) => _$RecoveredKeyFromJson(json);

@override final  String? seed;
@override final  String? root;
@override final  String? fingerprint;
@override final  String? network;

/// Create a copy of RecoveredKey
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecoveredKeyCopyWith<_RecoveredKey> get copyWith => __$RecoveredKeyCopyWithImpl<_RecoveredKey>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecoveredKeyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecoveredKey&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.root, root) || other.root == root)&&(identical(other.fingerprint, fingerprint) || other.fingerprint == fingerprint)&&(identical(other.network, network) || other.network == network));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seed,root,fingerprint,network);

@override
String toString() {
  return 'RecoveredKey(seed: $seed, root: $root, fingerprint: $fingerprint, network: $network)';
}


}

/// @nodoc
abstract mixin class _$RecoveredKeyCopyWith<$Res> implements $RecoveredKeyCopyWith<$Res> {
  factory _$RecoveredKeyCopyWith(_RecoveredKey value, $Res Function(_RecoveredKey) _then) = __$RecoveredKeyCopyWithImpl;
@override @useResult
$Res call({
 String? seed, String? root, String? fingerprint, String? network
});




}
/// @nodoc
class __$RecoveredKeyCopyWithImpl<$Res>
    implements _$RecoveredKeyCopyWith<$Res> {
  __$RecoveredKeyCopyWithImpl(this._self, this._then);

  final _RecoveredKey _self;
  final $Res Function(_RecoveredKey) _then;

/// Create a copy of RecoveredKey
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seed = freezed,Object? root = freezed,Object? fingerprint = freezed,Object? network = freezed,}) {
  return _then(_RecoveredKey(
seed: freezed == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as String?,root: freezed == root ? _self.root : root // ignore: cast_nullable_to_non_nullable
as String?,fingerprint: freezed == fingerprint ? _self.fingerprint : fingerprint // ignore: cast_nullable_to_non_nullable
as String?,network: freezed == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
