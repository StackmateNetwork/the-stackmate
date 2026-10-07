// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PreferencesState {

 bool get incognito; bool get bitcoinStandard; String get preferredBitcoinUnit; String get preferredExchange; String get preferredFiatUnit; String get errorPreferencesState;
/// Create a copy of PreferencesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreferencesStateCopyWith<PreferencesState> get copyWith => _$PreferencesStateCopyWithImpl<PreferencesState>(this as PreferencesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreferencesState&&(identical(other.incognito, incognito) || other.incognito == incognito)&&(identical(other.bitcoinStandard, bitcoinStandard) || other.bitcoinStandard == bitcoinStandard)&&(identical(other.preferredBitcoinUnit, preferredBitcoinUnit) || other.preferredBitcoinUnit == preferredBitcoinUnit)&&(identical(other.preferredExchange, preferredExchange) || other.preferredExchange == preferredExchange)&&(identical(other.preferredFiatUnit, preferredFiatUnit) || other.preferredFiatUnit == preferredFiatUnit)&&(identical(other.errorPreferencesState, errorPreferencesState) || other.errorPreferencesState == errorPreferencesState));
}


@override
int get hashCode => Object.hash(runtimeType,incognito,bitcoinStandard,preferredBitcoinUnit,preferredExchange,preferredFiatUnit,errorPreferencesState);

@override
String toString() {
  return 'PreferencesState(incognito: $incognito, bitcoinStandard: $bitcoinStandard, preferredBitcoinUnit: $preferredBitcoinUnit, preferredExchange: $preferredExchange, preferredFiatUnit: $preferredFiatUnit, errorPreferencesState: $errorPreferencesState)';
}


}

/// @nodoc
abstract mixin class $PreferencesStateCopyWith<$Res>  {
  factory $PreferencesStateCopyWith(PreferencesState value, $Res Function(PreferencesState) _then) = _$PreferencesStateCopyWithImpl;
@useResult
$Res call({
 bool incognito, bool bitcoinStandard, String preferredBitcoinUnit, String preferredExchange, String preferredFiatUnit, String errorPreferencesState
});




}
/// @nodoc
class _$PreferencesStateCopyWithImpl<$Res>
    implements $PreferencesStateCopyWith<$Res> {
  _$PreferencesStateCopyWithImpl(this._self, this._then);

  final PreferencesState _self;
  final $Res Function(PreferencesState) _then;

/// Create a copy of PreferencesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? incognito = null,Object? bitcoinStandard = null,Object? preferredBitcoinUnit = null,Object? preferredExchange = null,Object? preferredFiatUnit = null,Object? errorPreferencesState = null,}) {
  return _then(_self.copyWith(
incognito: null == incognito ? _self.incognito : incognito // ignore: cast_nullable_to_non_nullable
as bool,bitcoinStandard: null == bitcoinStandard ? _self.bitcoinStandard : bitcoinStandard // ignore: cast_nullable_to_non_nullable
as bool,preferredBitcoinUnit: null == preferredBitcoinUnit ? _self.preferredBitcoinUnit : preferredBitcoinUnit // ignore: cast_nullable_to_non_nullable
as String,preferredExchange: null == preferredExchange ? _self.preferredExchange : preferredExchange // ignore: cast_nullable_to_non_nullable
as String,preferredFiatUnit: null == preferredFiatUnit ? _self.preferredFiatUnit : preferredFiatUnit // ignore: cast_nullable_to_non_nullable
as String,errorPreferencesState: null == errorPreferencesState ? _self.errorPreferencesState : errorPreferencesState // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PreferencesState].
extension PreferencesStatePatterns on PreferencesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreferencesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreferencesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreferencesState value)  $default,){
final _that = this;
switch (_that) {
case _PreferencesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreferencesState value)?  $default,){
final _that = this;
switch (_that) {
case _PreferencesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool incognito,  bool bitcoinStandard,  String preferredBitcoinUnit,  String preferredExchange,  String preferredFiatUnit,  String errorPreferencesState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreferencesState() when $default != null:
return $default(_that.incognito,_that.bitcoinStandard,_that.preferredBitcoinUnit,_that.preferredExchange,_that.preferredFiatUnit,_that.errorPreferencesState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool incognito,  bool bitcoinStandard,  String preferredBitcoinUnit,  String preferredExchange,  String preferredFiatUnit,  String errorPreferencesState)  $default,) {final _that = this;
switch (_that) {
case _PreferencesState():
return $default(_that.incognito,_that.bitcoinStandard,_that.preferredBitcoinUnit,_that.preferredExchange,_that.preferredFiatUnit,_that.errorPreferencesState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool incognito,  bool bitcoinStandard,  String preferredBitcoinUnit,  String preferredExchange,  String preferredFiatUnit,  String errorPreferencesState)?  $default,) {final _that = this;
switch (_that) {
case _PreferencesState() when $default != null:
return $default(_that.incognito,_that.bitcoinStandard,_that.preferredBitcoinUnit,_that.preferredExchange,_that.preferredFiatUnit,_that.errorPreferencesState);case _:
  return null;

}
}

}

/// @nodoc


class _PreferencesState extends PreferencesState {
  const _PreferencesState({this.incognito = false, this.bitcoinStandard = false, this.preferredBitcoinUnit = 'sats', this.preferredExchange = 'CoinCap', this.preferredFiatUnit = 'USD', this.errorPreferencesState = ''}): super._();
  

@override@JsonKey() final  bool incognito;
@override@JsonKey() final  bool bitcoinStandard;
@override@JsonKey() final  String preferredBitcoinUnit;
@override@JsonKey() final  String preferredExchange;
@override@JsonKey() final  String preferredFiatUnit;
@override@JsonKey() final  String errorPreferencesState;

/// Create a copy of PreferencesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreferencesStateCopyWith<_PreferencesState> get copyWith => __$PreferencesStateCopyWithImpl<_PreferencesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreferencesState&&(identical(other.incognito, incognito) || other.incognito == incognito)&&(identical(other.bitcoinStandard, bitcoinStandard) || other.bitcoinStandard == bitcoinStandard)&&(identical(other.preferredBitcoinUnit, preferredBitcoinUnit) || other.preferredBitcoinUnit == preferredBitcoinUnit)&&(identical(other.preferredExchange, preferredExchange) || other.preferredExchange == preferredExchange)&&(identical(other.preferredFiatUnit, preferredFiatUnit) || other.preferredFiatUnit == preferredFiatUnit)&&(identical(other.errorPreferencesState, errorPreferencesState) || other.errorPreferencesState == errorPreferencesState));
}


@override
int get hashCode => Object.hash(runtimeType,incognito,bitcoinStandard,preferredBitcoinUnit,preferredExchange,preferredFiatUnit,errorPreferencesState);

@override
String toString() {
  return 'PreferencesState(incognito: $incognito, bitcoinStandard: $bitcoinStandard, preferredBitcoinUnit: $preferredBitcoinUnit, preferredExchange: $preferredExchange, preferredFiatUnit: $preferredFiatUnit, errorPreferencesState: $errorPreferencesState)';
}


}

/// @nodoc
abstract mixin class _$PreferencesStateCopyWith<$Res> implements $PreferencesStateCopyWith<$Res> {
  factory _$PreferencesStateCopyWith(_PreferencesState value, $Res Function(_PreferencesState) _then) = __$PreferencesStateCopyWithImpl;
@override @useResult
$Res call({
 bool incognito, bool bitcoinStandard, String preferredBitcoinUnit, String preferredExchange, String preferredFiatUnit, String errorPreferencesState
});




}
/// @nodoc
class __$PreferencesStateCopyWithImpl<$Res>
    implements _$PreferencesStateCopyWith<$Res> {
  __$PreferencesStateCopyWithImpl(this._self, this._then);

  final _PreferencesState _self;
  final $Res Function(_PreferencesState) _then;

/// Create a copy of PreferencesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? incognito = null,Object? bitcoinStandard = null,Object? preferredBitcoinUnit = null,Object? preferredExchange = null,Object? preferredFiatUnit = null,Object? errorPreferencesState = null,}) {
  return _then(_PreferencesState(
incognito: null == incognito ? _self.incognito : incognito // ignore: cast_nullable_to_non_nullable
as bool,bitcoinStandard: null == bitcoinStandard ? _self.bitcoinStandard : bitcoinStandard // ignore: cast_nullable_to_non_nullable
as bool,preferredBitcoinUnit: null == preferredBitcoinUnit ? _self.preferredBitcoinUnit : preferredBitcoinUnit // ignore: cast_nullable_to_non_nullable
as String,preferredExchange: null == preferredExchange ? _self.preferredExchange : preferredExchange // ignore: cast_nullable_to_non_nullable
as String,preferredFiatUnit: null == preferredFiatUnit ? _self.preferredFiatUnit : preferredFiatUnit // ignore: cast_nullable_to_non_nullable
as String,errorPreferencesState: null == errorPreferencesState ? _self.errorPreferencesState : errorPreferencesState // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
