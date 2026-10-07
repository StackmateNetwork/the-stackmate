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
mixin _$MasterKey {

 String? get seed; String? get root; String? get fingerprint; String? get network; bool? get backedUp;
/// Create a copy of MasterKey
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MasterKeyCopyWith<MasterKey> get copyWith => _$MasterKeyCopyWithImpl<MasterKey>(this as MasterKey, _$identity);

  /// Serializes this MasterKey to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MasterKey&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.root, root) || other.root == root)&&(identical(other.fingerprint, fingerprint) || other.fingerprint == fingerprint)&&(identical(other.network, network) || other.network == network)&&(identical(other.backedUp, backedUp) || other.backedUp == backedUp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seed,root,fingerprint,network,backedUp);

@override
String toString() {
  return 'MasterKey(seed: $seed, root: $root, fingerprint: $fingerprint, network: $network, backedUp: $backedUp)';
}


}

/// @nodoc
abstract mixin class $MasterKeyCopyWith<$Res>  {
  factory $MasterKeyCopyWith(MasterKey value, $Res Function(MasterKey) _then) = _$MasterKeyCopyWithImpl;
@useResult
$Res call({
 String? seed, String? root, String? fingerprint, String? network, bool? backedUp
});




}
/// @nodoc
class _$MasterKeyCopyWithImpl<$Res>
    implements $MasterKeyCopyWith<$Res> {
  _$MasterKeyCopyWithImpl(this._self, this._then);

  final MasterKey _self;
  final $Res Function(MasterKey) _then;

/// Create a copy of MasterKey
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seed = freezed,Object? root = freezed,Object? fingerprint = freezed,Object? network = freezed,Object? backedUp = freezed,}) {
  return _then(_self.copyWith(
seed: freezed == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as String?,root: freezed == root ? _self.root : root // ignore: cast_nullable_to_non_nullable
as String?,fingerprint: freezed == fingerprint ? _self.fingerprint : fingerprint // ignore: cast_nullable_to_non_nullable
as String?,network: freezed == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as String?,backedUp: freezed == backedUp ? _self.backedUp : backedUp // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [MasterKey].
extension MasterKeyPatterns on MasterKey {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MasterKey value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MasterKey() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MasterKey value)  $default,){
final _that = this;
switch (_that) {
case _MasterKey():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MasterKey value)?  $default,){
final _that = this;
switch (_that) {
case _MasterKey() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? seed,  String? root,  String? fingerprint,  String? network,  bool? backedUp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MasterKey() when $default != null:
return $default(_that.seed,_that.root,_that.fingerprint,_that.network,_that.backedUp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? seed,  String? root,  String? fingerprint,  String? network,  bool? backedUp)  $default,) {final _that = this;
switch (_that) {
case _MasterKey():
return $default(_that.seed,_that.root,_that.fingerprint,_that.network,_that.backedUp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? seed,  String? root,  String? fingerprint,  String? network,  bool? backedUp)?  $default,) {final _that = this;
switch (_that) {
case _MasterKey() when $default != null:
return $default(_that.seed,_that.root,_that.fingerprint,_that.network,_that.backedUp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MasterKey implements MasterKey {
  const _MasterKey({this.seed, this.root, this.fingerprint, this.network, this.backedUp});
  factory _MasterKey.fromJson(Map<String, dynamic> json) => _$MasterKeyFromJson(json);

@override final  String? seed;
@override final  String? root;
@override final  String? fingerprint;
@override final  String? network;
@override final  bool? backedUp;

/// Create a copy of MasterKey
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MasterKeyCopyWith<_MasterKey> get copyWith => __$MasterKeyCopyWithImpl<_MasterKey>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MasterKeyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MasterKey&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.root, root) || other.root == root)&&(identical(other.fingerprint, fingerprint) || other.fingerprint == fingerprint)&&(identical(other.network, network) || other.network == network)&&(identical(other.backedUp, backedUp) || other.backedUp == backedUp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seed,root,fingerprint,network,backedUp);

@override
String toString() {
  return 'MasterKey(seed: $seed, root: $root, fingerprint: $fingerprint, network: $network, backedUp: $backedUp)';
}


}

/// @nodoc
abstract mixin class _$MasterKeyCopyWith<$Res> implements $MasterKeyCopyWith<$Res> {
  factory _$MasterKeyCopyWith(_MasterKey value, $Res Function(_MasterKey) _then) = __$MasterKeyCopyWithImpl;
@override @useResult
$Res call({
 String? seed, String? root, String? fingerprint, String? network, bool? backedUp
});




}
/// @nodoc
class __$MasterKeyCopyWithImpl<$Res>
    implements _$MasterKeyCopyWith<$Res> {
  __$MasterKeyCopyWithImpl(this._self, this._then);

  final _MasterKey _self;
  final $Res Function(_MasterKey) _then;

/// Create a copy of MasterKey
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seed = freezed,Object? root = freezed,Object? fingerprint = freezed,Object? network = freezed,Object? backedUp = freezed,}) {
  return _then(_MasterKey(
seed: freezed == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as String?,root: freezed == root ? _self.root : root // ignore: cast_nullable_to_non_nullable
as String?,fingerprint: freezed == fingerprint ? _self.fingerprint : fingerprint // ignore: cast_nullable_to_non_nullable
as String?,network: freezed == network ? _self.network : network // ignore: cast_nullable_to_non_nullable
as String?,backedUp: freezed == backedUp ? _self.backedUp : backedUp // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
