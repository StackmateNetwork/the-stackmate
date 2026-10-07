// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NodeAddressState {

 String get address; String get errNodeState; String get name; bool get isEditing;
/// Create a copy of NodeAddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NodeAddressStateCopyWith<NodeAddressState> get copyWith => _$NodeAddressStateCopyWithImpl<NodeAddressState>(this as NodeAddressState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NodeAddressState&&(identical(other.address, address) || other.address == address)&&(identical(other.errNodeState, errNodeState) || other.errNodeState == errNodeState)&&(identical(other.name, name) || other.name == name)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing));
}


@override
int get hashCode => Object.hash(runtimeType,address,errNodeState,name,isEditing);

@override
String toString() {
  return 'NodeAddressState(address: $address, errNodeState: $errNodeState, name: $name, isEditing: $isEditing)';
}


}

/// @nodoc
abstract mixin class $NodeAddressStateCopyWith<$Res>  {
  factory $NodeAddressStateCopyWith(NodeAddressState value, $Res Function(NodeAddressState) _then) = _$NodeAddressStateCopyWithImpl;
@useResult
$Res call({
 String address, String errNodeState, String name, bool isEditing
});




}
/// @nodoc
class _$NodeAddressStateCopyWithImpl<$Res>
    implements $NodeAddressStateCopyWith<$Res> {
  _$NodeAddressStateCopyWithImpl(this._self, this._then);

  final NodeAddressState _self;
  final $Res Function(NodeAddressState) _then;

/// Create a copy of NodeAddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? errNodeState = null,Object? name = null,Object? isEditing = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,errNodeState: null == errNodeState ? _self.errNodeState : errNodeState // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NodeAddressState].
extension NodeAddressStatePatterns on NodeAddressState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NodeAddressState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NodeAddressState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NodeAddressState value)  $default,){
final _that = this;
switch (_that) {
case _NodeAddressState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NodeAddressState value)?  $default,){
final _that = this;
switch (_that) {
case _NodeAddressState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String address,  String errNodeState,  String name,  bool isEditing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NodeAddressState() when $default != null:
return $default(_that.address,_that.errNodeState,_that.name,_that.isEditing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String address,  String errNodeState,  String name,  bool isEditing)  $default,) {final _that = this;
switch (_that) {
case _NodeAddressState():
return $default(_that.address,_that.errNodeState,_that.name,_that.isEditing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String address,  String errNodeState,  String name,  bool isEditing)?  $default,) {final _that = this;
switch (_that) {
case _NodeAddressState() when $default != null:
return $default(_that.address,_that.errNodeState,_that.name,_that.isEditing);case _:
  return null;

}
}

}

/// @nodoc


class _NodeAddressState extends NodeAddressState {
  const _NodeAddressState({this.address = defaultNodeAddress, this.errNodeState = '', this.name = 'Blockstream', this.isEditing = false}): super._();
  

@override@JsonKey() final  String address;
@override@JsonKey() final  String errNodeState;
@override@JsonKey() final  String name;
@override@JsonKey() final  bool isEditing;

/// Create a copy of NodeAddressState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NodeAddressStateCopyWith<_NodeAddressState> get copyWith => __$NodeAddressStateCopyWithImpl<_NodeAddressState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NodeAddressState&&(identical(other.address, address) || other.address == address)&&(identical(other.errNodeState, errNodeState) || other.errNodeState == errNodeState)&&(identical(other.name, name) || other.name == name)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing));
}


@override
int get hashCode => Object.hash(runtimeType,address,errNodeState,name,isEditing);

@override
String toString() {
  return 'NodeAddressState(address: $address, errNodeState: $errNodeState, name: $name, isEditing: $isEditing)';
}


}

/// @nodoc
abstract mixin class _$NodeAddressStateCopyWith<$Res> implements $NodeAddressStateCopyWith<$Res> {
  factory _$NodeAddressStateCopyWith(_NodeAddressState value, $Res Function(_NodeAddressState) _then) = __$NodeAddressStateCopyWithImpl;
@override @useResult
$Res call({
 String address, String errNodeState, String name, bool isEditing
});




}
/// @nodoc
class __$NodeAddressStateCopyWithImpl<$Res>
    implements _$NodeAddressStateCopyWith<$Res> {
  __$NodeAddressStateCopyWithImpl(this._self, this._then);

  final _NodeAddressState _self;
  final $Res Function(_NodeAddressState) _then;

/// Create a copy of NodeAddressState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? errNodeState = null,Object? name = null,Object? isEditing = null,}) {
  return _then(_NodeAddressState(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,errNodeState: null == errNodeState ? _self.errNodeState : errNodeState // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
