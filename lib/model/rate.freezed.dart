// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Rate {

 String get symbol; String get name; double get rate;
/// Create a copy of Rate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateCopyWith<Rate> get copyWith => _$RateCopyWithImpl<Rate>(this as Rate, _$identity);

  /// Serializes this Rate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Rate&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.rate, rate) || other.rate == rate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,rate);

@override
String toString() {
  return 'Rate(symbol: $symbol, name: $name, rate: $rate)';
}


}

/// @nodoc
abstract mixin class $RateCopyWith<$Res>  {
  factory $RateCopyWith(Rate value, $Res Function(Rate) _then) = _$RateCopyWithImpl;
@useResult
$Res call({
 String symbol, String name, double rate
});




}
/// @nodoc
class _$RateCopyWithImpl<$Res>
    implements $RateCopyWith<$Res> {
  _$RateCopyWithImpl(this._self, this._then);

  final Rate _self;
  final $Res Function(Rate) _then;

/// Create a copy of Rate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? symbol = null,Object? name = null,Object? rate = null,}) {
  return _then(_self.copyWith(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Rate].
extension RatePatterns on Rate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Rate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Rate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Rate value)  $default,){
final _that = this;
switch (_that) {
case _Rate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Rate value)?  $default,){
final _that = this;
switch (_that) {
case _Rate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String symbol,  String name,  double rate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Rate() when $default != null:
return $default(_that.symbol,_that.name,_that.rate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String symbol,  String name,  double rate)  $default,) {final _that = this;
switch (_that) {
case _Rate():
return $default(_that.symbol,_that.name,_that.rate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String symbol,  String name,  double rate)?  $default,) {final _that = this;
switch (_that) {
case _Rate() when $default != null:
return $default(_that.symbol,_that.name,_that.rate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Rate implements Rate {
  const _Rate({required this.symbol, required this.name, required this.rate});
  factory _Rate.fromJson(Map<String, dynamic> json) => _$RateFromJson(json);

@override final  String symbol;
@override final  String name;
@override final  double rate;

/// Create a copy of Rate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RateCopyWith<_Rate> get copyWith => __$RateCopyWithImpl<_Rate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Rate&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.name, name) || other.name == name)&&(identical(other.rate, rate) || other.rate == rate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,symbol,name,rate);

@override
String toString() {
  return 'Rate(symbol: $symbol, name: $name, rate: $rate)';
}


}

/// @nodoc
abstract mixin class _$RateCopyWith<$Res> implements $RateCopyWith<$Res> {
  factory _$RateCopyWith(_Rate value, $Res Function(_Rate) _then) = __$RateCopyWithImpl;
@override @useResult
$Res call({
 String symbol, String name, double rate
});




}
/// @nodoc
class __$RateCopyWithImpl<$Res>
    implements _$RateCopyWith<$Res> {
  __$RateCopyWithImpl(this._self, this._then);

  final _Rate _self;
  final $Res Function(_Rate) _then;

/// Create a copy of Rate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? symbol = null,Object? name = null,Object? rate = null,}) {
  return _then(_Rate(
symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
