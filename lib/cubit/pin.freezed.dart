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
mixin _$PinState {

 String? get value; int get attemptsLeft; int get lastFailure; bool get isLocked; bool get isVerified; bool get hasChosenPin; bool get hasSetPin; bool get hasEnteredPin; String get setValue; String get confirmedValue; String get enteredValue; String get hiddenValue; String? get error;
/// Create a copy of PinState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PinStateCopyWith<PinState> get copyWith => _$PinStateCopyWithImpl<PinState>(this as PinState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PinState&&(identical(other.value, value) || other.value == value)&&(identical(other.attemptsLeft, attemptsLeft) || other.attemptsLeft == attemptsLeft)&&(identical(other.lastFailure, lastFailure) || other.lastFailure == lastFailure)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.hasChosenPin, hasChosenPin) || other.hasChosenPin == hasChosenPin)&&(identical(other.hasSetPin, hasSetPin) || other.hasSetPin == hasSetPin)&&(identical(other.hasEnteredPin, hasEnteredPin) || other.hasEnteredPin == hasEnteredPin)&&(identical(other.setValue, setValue) || other.setValue == setValue)&&(identical(other.confirmedValue, confirmedValue) || other.confirmedValue == confirmedValue)&&(identical(other.enteredValue, enteredValue) || other.enteredValue == enteredValue)&&(identical(other.hiddenValue, hiddenValue) || other.hiddenValue == hiddenValue)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,value,attemptsLeft,lastFailure,isLocked,isVerified,hasChosenPin,hasSetPin,hasEnteredPin,setValue,confirmedValue,enteredValue,hiddenValue,error);

@override
String toString() {
  return 'PinState(value: $value, attemptsLeft: $attemptsLeft, lastFailure: $lastFailure, isLocked: $isLocked, isVerified: $isVerified, hasChosenPin: $hasChosenPin, hasSetPin: $hasSetPin, hasEnteredPin: $hasEnteredPin, setValue: $setValue, confirmedValue: $confirmedValue, enteredValue: $enteredValue, hiddenValue: $hiddenValue, error: $error)';
}


}

/// @nodoc
abstract mixin class $PinStateCopyWith<$Res>  {
  factory $PinStateCopyWith(PinState value, $Res Function(PinState) _then) = _$PinStateCopyWithImpl;
@useResult
$Res call({
 String? value, int attemptsLeft, int lastFailure, bool isLocked, bool isVerified, bool hasChosenPin, bool hasSetPin, bool hasEnteredPin, String setValue, String confirmedValue, String enteredValue, String hiddenValue, String? error
});




}
/// @nodoc
class _$PinStateCopyWithImpl<$Res>
    implements $PinStateCopyWith<$Res> {
  _$PinStateCopyWithImpl(this._self, this._then);

  final PinState _self;
  final $Res Function(PinState) _then;

/// Create a copy of PinState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = freezed,Object? attemptsLeft = null,Object? lastFailure = null,Object? isLocked = null,Object? isVerified = null,Object? hasChosenPin = null,Object? hasSetPin = null,Object? hasEnteredPin = null,Object? setValue = null,Object? confirmedValue = null,Object? enteredValue = null,Object? hiddenValue = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,attemptsLeft: null == attemptsLeft ? _self.attemptsLeft : attemptsLeft // ignore: cast_nullable_to_non_nullable
as int,lastFailure: null == lastFailure ? _self.lastFailure : lastFailure // ignore: cast_nullable_to_non_nullable
as int,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,hasChosenPin: null == hasChosenPin ? _self.hasChosenPin : hasChosenPin // ignore: cast_nullable_to_non_nullable
as bool,hasSetPin: null == hasSetPin ? _self.hasSetPin : hasSetPin // ignore: cast_nullable_to_non_nullable
as bool,hasEnteredPin: null == hasEnteredPin ? _self.hasEnteredPin : hasEnteredPin // ignore: cast_nullable_to_non_nullable
as bool,setValue: null == setValue ? _self.setValue : setValue // ignore: cast_nullable_to_non_nullable
as String,confirmedValue: null == confirmedValue ? _self.confirmedValue : confirmedValue // ignore: cast_nullable_to_non_nullable
as String,enteredValue: null == enteredValue ? _self.enteredValue : enteredValue // ignore: cast_nullable_to_non_nullable
as String,hiddenValue: null == hiddenValue ? _self.hiddenValue : hiddenValue // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PinState].
extension PinStatePatterns on PinState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PinState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PinState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PinState value)  $default,){
final _that = this;
switch (_that) {
case _PinState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PinState value)?  $default,){
final _that = this;
switch (_that) {
case _PinState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? value,  int attemptsLeft,  int lastFailure,  bool isLocked,  bool isVerified,  bool hasChosenPin,  bool hasSetPin,  bool hasEnteredPin,  String setValue,  String confirmedValue,  String enteredValue,  String hiddenValue,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PinState() when $default != null:
return $default(_that.value,_that.attemptsLeft,_that.lastFailure,_that.isLocked,_that.isVerified,_that.hasChosenPin,_that.hasSetPin,_that.hasEnteredPin,_that.setValue,_that.confirmedValue,_that.enteredValue,_that.hiddenValue,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? value,  int attemptsLeft,  int lastFailure,  bool isLocked,  bool isVerified,  bool hasChosenPin,  bool hasSetPin,  bool hasEnteredPin,  String setValue,  String confirmedValue,  String enteredValue,  String hiddenValue,  String? error)  $default,) {final _that = this;
switch (_that) {
case _PinState():
return $default(_that.value,_that.attemptsLeft,_that.lastFailure,_that.isLocked,_that.isVerified,_that.hasChosenPin,_that.hasSetPin,_that.hasEnteredPin,_that.setValue,_that.confirmedValue,_that.enteredValue,_that.hiddenValue,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? value,  int attemptsLeft,  int lastFailure,  bool isLocked,  bool isVerified,  bool hasChosenPin,  bool hasSetPin,  bool hasEnteredPin,  String setValue,  String confirmedValue,  String enteredValue,  String hiddenValue,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _PinState() when $default != null:
return $default(_that.value,_that.attemptsLeft,_that.lastFailure,_that.isLocked,_that.isVerified,_that.hasChosenPin,_that.hasSetPin,_that.hasEnteredPin,_that.setValue,_that.confirmedValue,_that.enteredValue,_that.hiddenValue,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _PinState extends PinState {
  const _PinState({this.value, this.attemptsLeft = 3, this.lastFailure = 0, this.isLocked = false, this.isVerified = false, this.hasChosenPin = false, this.hasSetPin = false, this.hasEnteredPin = false, this.setValue = '', this.confirmedValue = '', this.enteredValue = '', this.hiddenValue = '', this.error}): super._();
  

@override final  String? value;
@override@JsonKey() final  int attemptsLeft;
@override@JsonKey() final  int lastFailure;
@override@JsonKey() final  bool isLocked;
@override@JsonKey() final  bool isVerified;
@override@JsonKey() final  bool hasChosenPin;
@override@JsonKey() final  bool hasSetPin;
@override@JsonKey() final  bool hasEnteredPin;
@override@JsonKey() final  String setValue;
@override@JsonKey() final  String confirmedValue;
@override@JsonKey() final  String enteredValue;
@override@JsonKey() final  String hiddenValue;
@override final  String? error;

/// Create a copy of PinState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PinStateCopyWith<_PinState> get copyWith => __$PinStateCopyWithImpl<_PinState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PinState&&(identical(other.value, value) || other.value == value)&&(identical(other.attemptsLeft, attemptsLeft) || other.attemptsLeft == attemptsLeft)&&(identical(other.lastFailure, lastFailure) || other.lastFailure == lastFailure)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.hasChosenPin, hasChosenPin) || other.hasChosenPin == hasChosenPin)&&(identical(other.hasSetPin, hasSetPin) || other.hasSetPin == hasSetPin)&&(identical(other.hasEnteredPin, hasEnteredPin) || other.hasEnteredPin == hasEnteredPin)&&(identical(other.setValue, setValue) || other.setValue == setValue)&&(identical(other.confirmedValue, confirmedValue) || other.confirmedValue == confirmedValue)&&(identical(other.enteredValue, enteredValue) || other.enteredValue == enteredValue)&&(identical(other.hiddenValue, hiddenValue) || other.hiddenValue == hiddenValue)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,value,attemptsLeft,lastFailure,isLocked,isVerified,hasChosenPin,hasSetPin,hasEnteredPin,setValue,confirmedValue,enteredValue,hiddenValue,error);

@override
String toString() {
  return 'PinState(value: $value, attemptsLeft: $attemptsLeft, lastFailure: $lastFailure, isLocked: $isLocked, isVerified: $isVerified, hasChosenPin: $hasChosenPin, hasSetPin: $hasSetPin, hasEnteredPin: $hasEnteredPin, setValue: $setValue, confirmedValue: $confirmedValue, enteredValue: $enteredValue, hiddenValue: $hiddenValue, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PinStateCopyWith<$Res> implements $PinStateCopyWith<$Res> {
  factory _$PinStateCopyWith(_PinState value, $Res Function(_PinState) _then) = __$PinStateCopyWithImpl;
@override @useResult
$Res call({
 String? value, int attemptsLeft, int lastFailure, bool isLocked, bool isVerified, bool hasChosenPin, bool hasSetPin, bool hasEnteredPin, String setValue, String confirmedValue, String enteredValue, String hiddenValue, String? error
});




}
/// @nodoc
class __$PinStateCopyWithImpl<$Res>
    implements _$PinStateCopyWith<$Res> {
  __$PinStateCopyWithImpl(this._self, this._then);

  final _PinState _self;
  final $Res Function(_PinState) _then;

/// Create a copy of PinState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = freezed,Object? attemptsLeft = null,Object? lastFailure = null,Object? isLocked = null,Object? isVerified = null,Object? hasChosenPin = null,Object? hasSetPin = null,Object? hasEnteredPin = null,Object? setValue = null,Object? confirmedValue = null,Object? enteredValue = null,Object? hiddenValue = null,Object? error = freezed,}) {
  return _then(_PinState(
value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,attemptsLeft: null == attemptsLeft ? _self.attemptsLeft : attemptsLeft // ignore: cast_nullable_to_non_nullable
as int,lastFailure: null == lastFailure ? _self.lastFailure : lastFailure // ignore: cast_nullable_to_non_nullable
as int,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,hasChosenPin: null == hasChosenPin ? _self.hasChosenPin : hasChosenPin // ignore: cast_nullable_to_non_nullable
as bool,hasSetPin: null == hasSetPin ? _self.hasSetPin : hasSetPin // ignore: cast_nullable_to_non_nullable
as bool,hasEnteredPin: null == hasEnteredPin ? _self.hasEnteredPin : hasEnteredPin // ignore: cast_nullable_to_non_nullable
as bool,setValue: null == setValue ? _self.setValue : setValue // ignore: cast_nullable_to_non_nullable
as String,confirmedValue: null == confirmedValue ? _self.confirmedValue : confirmedValue // ignore: cast_nullable_to_non_nullable
as String,enteredValue: null == enteredValue ? _self.enteredValue : enteredValue // ignore: cast_nullable_to_non_nullable
as String,hiddenValue: null == hiddenValue ? _self.hiddenValue : hiddenValue // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
