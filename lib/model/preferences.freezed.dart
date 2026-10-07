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
mixin _$Preferences {

@HiveField(0) bool get incognito;@HiveField(1) bool get bitcoinStandard;@HiveField(2) String get preferredBitcoinUnit;@HiveField(3) String get preferredExchange;@HiveField(4) String get preferredFiatUnit;
/// Create a copy of Preferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreferencesCopyWith<Preferences> get copyWith => _$PreferencesCopyWithImpl<Preferences>(this as Preferences, _$identity);

  /// Serializes this Preferences to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Preferences&&(identical(other.incognito, incognito) || other.incognito == incognito)&&(identical(other.bitcoinStandard, bitcoinStandard) || other.bitcoinStandard == bitcoinStandard)&&(identical(other.preferredBitcoinUnit, preferredBitcoinUnit) || other.preferredBitcoinUnit == preferredBitcoinUnit)&&(identical(other.preferredExchange, preferredExchange) || other.preferredExchange == preferredExchange)&&(identical(other.preferredFiatUnit, preferredFiatUnit) || other.preferredFiatUnit == preferredFiatUnit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,incognito,bitcoinStandard,preferredBitcoinUnit,preferredExchange,preferredFiatUnit);

@override
String toString() {
  return 'Preferences(incognito: $incognito, bitcoinStandard: $bitcoinStandard, preferredBitcoinUnit: $preferredBitcoinUnit, preferredExchange: $preferredExchange, preferredFiatUnit: $preferredFiatUnit)';
}


}

/// @nodoc
abstract mixin class $PreferencesCopyWith<$Res>  {
  factory $PreferencesCopyWith(Preferences value, $Res Function(Preferences) _then) = _$PreferencesCopyWithImpl;
@useResult
$Res call({
@HiveField(0) bool incognito,@HiveField(1) bool bitcoinStandard,@HiveField(2) String preferredBitcoinUnit,@HiveField(3) String preferredExchange,@HiveField(4) String preferredFiatUnit
});




}
/// @nodoc
class _$PreferencesCopyWithImpl<$Res>
    implements $PreferencesCopyWith<$Res> {
  _$PreferencesCopyWithImpl(this._self, this._then);

  final Preferences _self;
  final $Res Function(Preferences) _then;

/// Create a copy of Preferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? incognito = null,Object? bitcoinStandard = null,Object? preferredBitcoinUnit = null,Object? preferredExchange = null,Object? preferredFiatUnit = null,}) {
  return _then(_self.copyWith(
incognito: null == incognito ? _self.incognito : incognito // ignore: cast_nullable_to_non_nullable
as bool,bitcoinStandard: null == bitcoinStandard ? _self.bitcoinStandard : bitcoinStandard // ignore: cast_nullable_to_non_nullable
as bool,preferredBitcoinUnit: null == preferredBitcoinUnit ? _self.preferredBitcoinUnit : preferredBitcoinUnit // ignore: cast_nullable_to_non_nullable
as String,preferredExchange: null == preferredExchange ? _self.preferredExchange : preferredExchange // ignore: cast_nullable_to_non_nullable
as String,preferredFiatUnit: null == preferredFiatUnit ? _self.preferredFiatUnit : preferredFiatUnit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Preferences].
extension PreferencesPatterns on Preferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Preferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Preferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Preferences value)  $default,){
final _that = this;
switch (_that) {
case _Preferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Preferences value)?  $default,){
final _that = this;
switch (_that) {
case _Preferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  bool incognito, @HiveField(1)  bool bitcoinStandard, @HiveField(2)  String preferredBitcoinUnit, @HiveField(3)  String preferredExchange, @HiveField(4)  String preferredFiatUnit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Preferences() when $default != null:
return $default(_that.incognito,_that.bitcoinStandard,_that.preferredBitcoinUnit,_that.preferredExchange,_that.preferredFiatUnit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  bool incognito, @HiveField(1)  bool bitcoinStandard, @HiveField(2)  String preferredBitcoinUnit, @HiveField(3)  String preferredExchange, @HiveField(4)  String preferredFiatUnit)  $default,) {final _that = this;
switch (_that) {
case _Preferences():
return $default(_that.incognito,_that.bitcoinStandard,_that.preferredBitcoinUnit,_that.preferredExchange,_that.preferredFiatUnit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  bool incognito, @HiveField(1)  bool bitcoinStandard, @HiveField(2)  String preferredBitcoinUnit, @HiveField(3)  String preferredExchange, @HiveField(4)  String preferredFiatUnit)?  $default,) {final _that = this;
switch (_that) {
case _Preferences() when $default != null:
return $default(_that.incognito,_that.bitcoinStandard,_that.preferredBitcoinUnit,_that.preferredExchange,_that.preferredFiatUnit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 2, adapterName: 'PreferencesClassAdapter')
class _Preferences extends Preferences {
  const _Preferences({@HiveField(0) required this.incognito, @HiveField(1) required this.bitcoinStandard, @HiveField(2) required this.preferredBitcoinUnit, @HiveField(3) required this.preferredExchange, @HiveField(4) required this.preferredFiatUnit}): super._();
  factory _Preferences.fromJson(Map<String, dynamic> json) => _$PreferencesFromJson(json);

@override@HiveField(0) final  bool incognito;
@override@HiveField(1) final  bool bitcoinStandard;
@override@HiveField(2) final  String preferredBitcoinUnit;
@override@HiveField(3) final  String preferredExchange;
@override@HiveField(4) final  String preferredFiatUnit;

/// Create a copy of Preferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreferencesCopyWith<_Preferences> get copyWith => __$PreferencesCopyWithImpl<_Preferences>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreferencesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Preferences&&(identical(other.incognito, incognito) || other.incognito == incognito)&&(identical(other.bitcoinStandard, bitcoinStandard) || other.bitcoinStandard == bitcoinStandard)&&(identical(other.preferredBitcoinUnit, preferredBitcoinUnit) || other.preferredBitcoinUnit == preferredBitcoinUnit)&&(identical(other.preferredExchange, preferredExchange) || other.preferredExchange == preferredExchange)&&(identical(other.preferredFiatUnit, preferredFiatUnit) || other.preferredFiatUnit == preferredFiatUnit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,incognito,bitcoinStandard,preferredBitcoinUnit,preferredExchange,preferredFiatUnit);

@override
String toString() {
  return 'Preferences(incognito: $incognito, bitcoinStandard: $bitcoinStandard, preferredBitcoinUnit: $preferredBitcoinUnit, preferredExchange: $preferredExchange, preferredFiatUnit: $preferredFiatUnit)';
}


}

/// @nodoc
abstract mixin class _$PreferencesCopyWith<$Res> implements $PreferencesCopyWith<$Res> {
  factory _$PreferencesCopyWith(_Preferences value, $Res Function(_Preferences) _then) = __$PreferencesCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) bool incognito,@HiveField(1) bool bitcoinStandard,@HiveField(2) String preferredBitcoinUnit,@HiveField(3) String preferredExchange,@HiveField(4) String preferredFiatUnit
});




}
/// @nodoc
class __$PreferencesCopyWithImpl<$Res>
    implements _$PreferencesCopyWith<$Res> {
  __$PreferencesCopyWithImpl(this._self, this._then);

  final _Preferences _self;
  final $Res Function(_Preferences) _then;

/// Create a copy of Preferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? incognito = null,Object? bitcoinStandard = null,Object? preferredBitcoinUnit = null,Object? preferredExchange = null,Object? preferredFiatUnit = null,}) {
  return _then(_Preferences(
incognito: null == incognito ? _self.incognito : incognito // ignore: cast_nullable_to_non_nullable
as bool,bitcoinStandard: null == bitcoinStandard ? _self.bitcoinStandard : bitcoinStandard // ignore: cast_nullable_to_non_nullable
as bool,preferredBitcoinUnit: null == preferredBitcoinUnit ? _self.preferredBitcoinUnit : preferredBitcoinUnit // ignore: cast_nullable_to_non_nullable
as String,preferredExchange: null == preferredExchange ? _self.preferredExchange : preferredExchange // ignore: cast_nullable_to_non_nullable
as String,preferredFiatUnit: null == preferredFiatUnit ? _self.preferredFiatUnit : preferredFiatUnit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
