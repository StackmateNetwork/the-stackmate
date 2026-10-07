// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fees.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeesState implements DiagnosticableTreeMixin {

 Fees get fees; bool get updating; String get errUpdating; String get networkStrength;
/// Create a copy of FeesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeesStateCopyWith<FeesState> get copyWith => _$FeesStateCopyWithImpl<FeesState>(this as FeesState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FeesState'))
    ..add(DiagnosticsProperty('fees', fees))..add(DiagnosticsProperty('updating', updating))..add(DiagnosticsProperty('errUpdating', errUpdating))..add(DiagnosticsProperty('networkStrength', networkStrength));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeesState&&(identical(other.fees, fees) || other.fees == fees)&&(identical(other.updating, updating) || other.updating == updating)&&(identical(other.errUpdating, errUpdating) || other.errUpdating == errUpdating)&&(identical(other.networkStrength, networkStrength) || other.networkStrength == networkStrength));
}


@override
int get hashCode => Object.hash(runtimeType,fees,updating,errUpdating,networkStrength);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FeesState(fees: $fees, updating: $updating, errUpdating: $errUpdating, networkStrength: $networkStrength)';
}


}

/// @nodoc
abstract mixin class $FeesStateCopyWith<$Res>  {
  factory $FeesStateCopyWith(FeesState value, $Res Function(FeesState) _then) = _$FeesStateCopyWithImpl;
@useResult
$Res call({
 Fees fees, bool updating, String errUpdating, String networkStrength
});


$FeesCopyWith<$Res> get fees;

}
/// @nodoc
class _$FeesStateCopyWithImpl<$Res>
    implements $FeesStateCopyWith<$Res> {
  _$FeesStateCopyWithImpl(this._self, this._then);

  final FeesState _self;
  final $Res Function(FeesState) _then;

/// Create a copy of FeesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fees = null,Object? updating = null,Object? errUpdating = null,Object? networkStrength = null,}) {
  return _then(_self.copyWith(
fees: null == fees ? _self.fees : fees // ignore: cast_nullable_to_non_nullable
as Fees,updating: null == updating ? _self.updating : updating // ignore: cast_nullable_to_non_nullable
as bool,errUpdating: null == errUpdating ? _self.errUpdating : errUpdating // ignore: cast_nullable_to_non_nullable
as String,networkStrength: null == networkStrength ? _self.networkStrength : networkStrength // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of FeesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeesCopyWith<$Res> get fees {
  
  return $FeesCopyWith<$Res>(_self.fees, (value) {
    return _then(_self.copyWith(fees: value));
  });
}
}


/// Adds pattern-matching-related methods to [FeesState].
extension FeesStatePatterns on FeesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeesState value)  $default,){
final _that = this;
switch (_that) {
case _FeesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeesState value)?  $default,){
final _that = this;
switch (_that) {
case _FeesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Fees fees,  bool updating,  String errUpdating,  String networkStrength)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeesState() when $default != null:
return $default(_that.fees,_that.updating,_that.errUpdating,_that.networkStrength);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Fees fees,  bool updating,  String errUpdating,  String networkStrength)  $default,) {final _that = this;
switch (_that) {
case _FeesState():
return $default(_that.fees,_that.updating,_that.errUpdating,_that.networkStrength);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Fees fees,  bool updating,  String errUpdating,  String networkStrength)?  $default,) {final _that = this;
switch (_that) {
case _FeesState() when $default != null:
return $default(_that.fees,_that.updating,_that.errUpdating,_that.networkStrength);case _:
  return null;

}
}

}

/// @nodoc


class _FeesState with DiagnosticableTreeMixin implements FeesState {
  const _FeesState({this.fees = const Fees(timestamp: 0, slow: 0.0, medium: 0.0, fast: 0.0), this.updating = false, this.errUpdating = '', this.networkStrength = ''});
  

@override@JsonKey() final  Fees fees;
@override@JsonKey() final  bool updating;
@override@JsonKey() final  String errUpdating;
@override@JsonKey() final  String networkStrength;

/// Create a copy of FeesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeesStateCopyWith<_FeesState> get copyWith => __$FeesStateCopyWithImpl<_FeesState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FeesState'))
    ..add(DiagnosticsProperty('fees', fees))..add(DiagnosticsProperty('updating', updating))..add(DiagnosticsProperty('errUpdating', errUpdating))..add(DiagnosticsProperty('networkStrength', networkStrength));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeesState&&(identical(other.fees, fees) || other.fees == fees)&&(identical(other.updating, updating) || other.updating == updating)&&(identical(other.errUpdating, errUpdating) || other.errUpdating == errUpdating)&&(identical(other.networkStrength, networkStrength) || other.networkStrength == networkStrength));
}


@override
int get hashCode => Object.hash(runtimeType,fees,updating,errUpdating,networkStrength);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FeesState(fees: $fees, updating: $updating, errUpdating: $errUpdating, networkStrength: $networkStrength)';
}


}

/// @nodoc
abstract mixin class _$FeesStateCopyWith<$Res> implements $FeesStateCopyWith<$Res> {
  factory _$FeesStateCopyWith(_FeesState value, $Res Function(_FeesState) _then) = __$FeesStateCopyWithImpl;
@override @useResult
$Res call({
 Fees fees, bool updating, String errUpdating, String networkStrength
});


@override $FeesCopyWith<$Res> get fees;

}
/// @nodoc
class __$FeesStateCopyWithImpl<$Res>
    implements _$FeesStateCopyWith<$Res> {
  __$FeesStateCopyWithImpl(this._self, this._then);

  final _FeesState _self;
  final $Res Function(_FeesState) _then;

/// Create a copy of FeesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fees = null,Object? updating = null,Object? errUpdating = null,Object? networkStrength = null,}) {
  return _then(_FeesState(
fees: null == fees ? _self.fees : fees // ignore: cast_nullable_to_non_nullable
as Fees,updating: null == updating ? _self.updating : updating // ignore: cast_nullable_to_non_nullable
as bool,errUpdating: null == errUpdating ? _self.errUpdating : errUpdating // ignore: cast_nullable_to_non_nullable
as String,networkStrength: null == networkStrength ? _self.networkStrength : networkStrength // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of FeesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeesCopyWith<$Res> get fees {
  
  return $FeesCopyWith<$Res>(_self.fees, (value) {
    return _then(_self.copyWith(fees: value));
  });
}
}

// dart format on
