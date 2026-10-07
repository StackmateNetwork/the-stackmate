// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chain-select.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BlockchainState {

 Blockchain get blockchain;
/// Create a copy of BlockchainState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockchainStateCopyWith<BlockchainState> get copyWith => _$BlockchainStateCopyWithImpl<BlockchainState>(this as BlockchainState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlockchainState&&(identical(other.blockchain, blockchain) || other.blockchain == blockchain));
}


@override
int get hashCode => Object.hash(runtimeType,blockchain);

@override
String toString() {
  return 'BlockchainState(blockchain: $blockchain)';
}


}

/// @nodoc
abstract mixin class $BlockchainStateCopyWith<$Res>  {
  factory $BlockchainStateCopyWith(BlockchainState value, $Res Function(BlockchainState) _then) = _$BlockchainStateCopyWithImpl;
@useResult
$Res call({
 Blockchain blockchain
});




}
/// @nodoc
class _$BlockchainStateCopyWithImpl<$Res>
    implements $BlockchainStateCopyWith<$Res> {
  _$BlockchainStateCopyWithImpl(this._self, this._then);

  final BlockchainState _self;
  final $Res Function(BlockchainState) _then;

/// Create a copy of BlockchainState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? blockchain = null,}) {
  return _then(_self.copyWith(
blockchain: null == blockchain ? _self.blockchain : blockchain // ignore: cast_nullable_to_non_nullable
as Blockchain,
  ));
}

}


/// Adds pattern-matching-related methods to [BlockchainState].
extension BlockchainStatePatterns on BlockchainState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BlockchainState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BlockchainState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BlockchainState value)  $default,){
final _that = this;
switch (_that) {
case _BlockchainState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BlockchainState value)?  $default,){
final _that = this;
switch (_that) {
case _BlockchainState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Blockchain blockchain)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BlockchainState() when $default != null:
return $default(_that.blockchain);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Blockchain blockchain)  $default,) {final _that = this;
switch (_that) {
case _BlockchainState():
return $default(_that.blockchain);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Blockchain blockchain)?  $default,) {final _that = this;
switch (_that) {
case _BlockchainState() when $default != null:
return $default(_that.blockchain);case _:
  return null;

}
}

}

/// @nodoc


class _BlockchainState implements BlockchainState {
  const _BlockchainState({this.blockchain = Blockchain.main});
  

@override@JsonKey() final  Blockchain blockchain;

/// Create a copy of BlockchainState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlockchainStateCopyWith<_BlockchainState> get copyWith => __$BlockchainStateCopyWithImpl<_BlockchainState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlockchainState&&(identical(other.blockchain, blockchain) || other.blockchain == blockchain));
}


@override
int get hashCode => Object.hash(runtimeType,blockchain);

@override
String toString() {
  return 'BlockchainState(blockchain: $blockchain)';
}


}

/// @nodoc
abstract mixin class _$BlockchainStateCopyWith<$Res> implements $BlockchainStateCopyWith<$Res> {
  factory _$BlockchainStateCopyWith(_BlockchainState value, $Res Function(_BlockchainState) _then) = __$BlockchainStateCopyWithImpl;
@override @useResult
$Res call({
 Blockchain blockchain
});




}
/// @nodoc
class __$BlockchainStateCopyWithImpl<$Res>
    implements _$BlockchainStateCopyWith<$Res> {
  __$BlockchainStateCopyWithImpl(this._self, this._then);

  final _BlockchainState _self;
  final $Res Function(_BlockchainState) _then;

/// Create a copy of BlockchainState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? blockchain = null,}) {
  return _then(_BlockchainState(
blockchain: null == blockchain ? _self.blockchain : blockchain // ignore: cast_nullable_to_non_nullable
as Blockchain,
  ));
}


}

// dart format on
