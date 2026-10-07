// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bump-fee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BumpFeeState implements DiagnosticableTreeMixin {

 String get feeRate; bool get bumping; String get error; String get newTxid;
/// Create a copy of BumpFeeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BumpFeeStateCopyWith<BumpFeeState> get copyWith => _$BumpFeeStateCopyWithImpl<BumpFeeState>(this as BumpFeeState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BumpFeeState'))
    ..add(DiagnosticsProperty('feeRate', feeRate))..add(DiagnosticsProperty('bumping', bumping))..add(DiagnosticsProperty('error', error))..add(DiagnosticsProperty('newTxid', newTxid));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BumpFeeState&&(identical(other.feeRate, feeRate) || other.feeRate == feeRate)&&(identical(other.bumping, bumping) || other.bumping == bumping)&&(identical(other.error, error) || other.error == error)&&(identical(other.newTxid, newTxid) || other.newTxid == newTxid));
}


@override
int get hashCode => Object.hash(runtimeType,feeRate,bumping,error,newTxid);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BumpFeeState(feeRate: $feeRate, bumping: $bumping, error: $error, newTxid: $newTxid)';
}


}

/// @nodoc
abstract mixin class $BumpFeeStateCopyWith<$Res>  {
  factory $BumpFeeStateCopyWith(BumpFeeState value, $Res Function(BumpFeeState) _then) = _$BumpFeeStateCopyWithImpl;
@useResult
$Res call({
 String feeRate, bool bumping, String error, String newTxid
});




}
/// @nodoc
class _$BumpFeeStateCopyWithImpl<$Res>
    implements $BumpFeeStateCopyWith<$Res> {
  _$BumpFeeStateCopyWithImpl(this._self, this._then);

  final BumpFeeState _self;
  final $Res Function(BumpFeeState) _then;

/// Create a copy of BumpFeeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? feeRate = null,Object? bumping = null,Object? error = null,Object? newTxid = null,}) {
  return _then(_self.copyWith(
feeRate: null == feeRate ? _self.feeRate : feeRate // ignore: cast_nullable_to_non_nullable
as String,bumping: null == bumping ? _self.bumping : bumping // ignore: cast_nullable_to_non_nullable
as bool,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,newTxid: null == newTxid ? _self.newTxid : newTxid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BumpFeeState].
extension BumpFeeStatePatterns on BumpFeeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BumpFeeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BumpFeeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BumpFeeState value)  $default,){
final _that = this;
switch (_that) {
case _BumpFeeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BumpFeeState value)?  $default,){
final _that = this;
switch (_that) {
case _BumpFeeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String feeRate,  bool bumping,  String error,  String newTxid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BumpFeeState() when $default != null:
return $default(_that.feeRate,_that.bumping,_that.error,_that.newTxid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String feeRate,  bool bumping,  String error,  String newTxid)  $default,) {final _that = this;
switch (_that) {
case _BumpFeeState():
return $default(_that.feeRate,_that.bumping,_that.error,_that.newTxid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String feeRate,  bool bumping,  String error,  String newTxid)?  $default,) {final _that = this;
switch (_that) {
case _BumpFeeState() when $default != null:
return $default(_that.feeRate,_that.bumping,_that.error,_that.newTxid);case _:
  return null;

}
}

}

/// @nodoc


class _BumpFeeState extends BumpFeeState with DiagnosticableTreeMixin {
  const _BumpFeeState({this.feeRate = '', this.bumping = false, this.error = '', this.newTxid = ''}): super._();
  

@override@JsonKey() final  String feeRate;
@override@JsonKey() final  bool bumping;
@override@JsonKey() final  String error;
@override@JsonKey() final  String newTxid;

/// Create a copy of BumpFeeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BumpFeeStateCopyWith<_BumpFeeState> get copyWith => __$BumpFeeStateCopyWithImpl<_BumpFeeState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BumpFeeState'))
    ..add(DiagnosticsProperty('feeRate', feeRate))..add(DiagnosticsProperty('bumping', bumping))..add(DiagnosticsProperty('error', error))..add(DiagnosticsProperty('newTxid', newTxid));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BumpFeeState&&(identical(other.feeRate, feeRate) || other.feeRate == feeRate)&&(identical(other.bumping, bumping) || other.bumping == bumping)&&(identical(other.error, error) || other.error == error)&&(identical(other.newTxid, newTxid) || other.newTxid == newTxid));
}


@override
int get hashCode => Object.hash(runtimeType,feeRate,bumping,error,newTxid);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BumpFeeState(feeRate: $feeRate, bumping: $bumping, error: $error, newTxid: $newTxid)';
}


}

/// @nodoc
abstract mixin class _$BumpFeeStateCopyWith<$Res> implements $BumpFeeStateCopyWith<$Res> {
  factory _$BumpFeeStateCopyWith(_BumpFeeState value, $Res Function(_BumpFeeState) _then) = __$BumpFeeStateCopyWithImpl;
@override @useResult
$Res call({
 String feeRate, bool bumping, String error, String newTxid
});




}
/// @nodoc
class __$BumpFeeStateCopyWithImpl<$Res>
    implements _$BumpFeeStateCopyWith<$Res> {
  __$BumpFeeStateCopyWithImpl(this._self, this._then);

  final _BumpFeeState _self;
  final $Res Function(_BumpFeeState) _then;

/// Create a copy of BumpFeeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? feeRate = null,Object? bumping = null,Object? error = null,Object? newTxid = null,}) {
  return _then(_BumpFeeState(
feeRate: null == feeRate ? _self.feeRate : feeRate // ignore: cast_nullable_to_non_nullable
as String,bumping: null == bumping ? _self.bumping : bumping // ignore: cast_nullable_to_non_nullable
as bool,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,newTxid: null == newTxid ? _self.newTxid : newTxid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
