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
mixin _$Fees {

@HiveField(0) int get timestamp;@HiveField(1) double get slow;@HiveField(2) double get medium;@HiveField(3) double get fast;
/// Create a copy of Fees
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeesCopyWith<Fees> get copyWith => _$FeesCopyWithImpl<Fees>(this as Fees, _$identity);

  /// Serializes this Fees to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Fees&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.slow, slow) || other.slow == slow)&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.fast, fast) || other.fast == fast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,slow,medium,fast);

@override
String toString() {
  return 'Fees(timestamp: $timestamp, slow: $slow, medium: $medium, fast: $fast)';
}


}

/// @nodoc
abstract mixin class $FeesCopyWith<$Res>  {
  factory $FeesCopyWith(Fees value, $Res Function(Fees) _then) = _$FeesCopyWithImpl;
@useResult
$Res call({
@HiveField(0) int timestamp,@HiveField(1) double slow,@HiveField(2) double medium,@HiveField(3) double fast
});




}
/// @nodoc
class _$FeesCopyWithImpl<$Res>
    implements $FeesCopyWith<$Res> {
  _$FeesCopyWithImpl(this._self, this._then);

  final Fees _self;
  final $Res Function(Fees) _then;

/// Create a copy of Fees
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,Object? slow = null,Object? medium = null,Object? fast = null,}) {
  return _then(_self.copyWith(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,slow: null == slow ? _self.slow : slow // ignore: cast_nullable_to_non_nullable
as double,medium: null == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as double,fast: null == fast ? _self.fast : fast // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Fees].
extension FeesPatterns on Fees {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Fees value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Fees() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Fees value)  $default,){
final _that = this;
switch (_that) {
case _Fees():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Fees value)?  $default,){
final _that = this;
switch (_that) {
case _Fees() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  int timestamp, @HiveField(1)  double slow, @HiveField(2)  double medium, @HiveField(3)  double fast)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Fees() when $default != null:
return $default(_that.timestamp,_that.slow,_that.medium,_that.fast);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  int timestamp, @HiveField(1)  double slow, @HiveField(2)  double medium, @HiveField(3)  double fast)  $default,) {final _that = this;
switch (_that) {
case _Fees():
return $default(_that.timestamp,_that.slow,_that.medium,_that.fast);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  int timestamp, @HiveField(1)  double slow, @HiveField(2)  double medium, @HiveField(3)  double fast)?  $default,) {final _that = this;
switch (_that) {
case _Fees() when $default != null:
return $default(_that.timestamp,_that.slow,_that.medium,_that.fast);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 5, adapterName: 'FeesClassAdapter')
class _Fees extends Fees {
  const _Fees({@HiveField(0) required this.timestamp, @HiveField(1) required this.slow, @HiveField(2) required this.medium, @HiveField(3) required this.fast}): super._();
  factory _Fees.fromJson(Map<String, dynamic> json) => _$FeesFromJson(json);

@override@HiveField(0) final  int timestamp;
@override@HiveField(1) final  double slow;
@override@HiveField(2) final  double medium;
@override@HiveField(3) final  double fast;

/// Create a copy of Fees
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeesCopyWith<_Fees> get copyWith => __$FeesCopyWithImpl<_Fees>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fees&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.slow, slow) || other.slow == slow)&&(identical(other.medium, medium) || other.medium == medium)&&(identical(other.fast, fast) || other.fast == fast));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp,slow,medium,fast);

@override
String toString() {
  return 'Fees(timestamp: $timestamp, slow: $slow, medium: $medium, fast: $fast)';
}


}

/// @nodoc
abstract mixin class _$FeesCopyWith<$Res> implements $FeesCopyWith<$Res> {
  factory _$FeesCopyWith(_Fees value, $Res Function(_Fees) _then) = __$FeesCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) int timestamp,@HiveField(1) double slow,@HiveField(2) double medium,@HiveField(3) double fast
});




}
/// @nodoc
class __$FeesCopyWithImpl<$Res>
    implements _$FeesCopyWith<$Res> {
  __$FeesCopyWithImpl(this._self, this._then);

  final _Fees _self;
  final $Res Function(_Fees) _then;

/// Create a copy of Fees
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,Object? slow = null,Object? medium = null,Object? fast = null,}) {
  return _then(_Fees(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as int,slow: null == slow ? _self.slow : slow // ignore: cast_nullable_to_non_nullable
as double,medium: null == medium ? _self.medium : medium // ignore: cast_nullable_to_non_nullable
as double,fast: null == fast ? _self.fast : fast // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
