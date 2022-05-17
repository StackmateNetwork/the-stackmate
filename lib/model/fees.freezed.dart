// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fees.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Fees _$FeesFromJson(Map<String, dynamic> json) {
  return _Fees.fromJson(json);
}

/// @nodoc
class _$FeesTearOff {
  const _$FeesTearOff();

  _Fees call(
      {@HiveField(0) required int timestamp,
      @HiveField(1) required double slow,
      @HiveField(2) required double medium,
      @HiveField(3) required double fast}) {
    return _Fees(
      timestamp: timestamp,
      slow: slow,
      medium: medium,
      fast: fast,
    );
  }

  Fees fromJson(Map<String, Object> json) {
    return Fees.fromJson(json);
  }
}

/// @nodoc
const $Fees = _$FeesTearOff();

/// @nodoc
mixin _$Fees {
  @HiveField(0)
  int get timestamp => throw _privateConstructorUsedError;
  @HiveField(1)
  double get slow => throw _privateConstructorUsedError;
  @HiveField(2)
  double get medium => throw _privateConstructorUsedError;
  @HiveField(3)
  double get fast => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeesCopyWith<Fees> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeesCopyWith<$Res> {
  factory $FeesCopyWith(Fees value, $Res Function(Fees) then) =
      _$FeesCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int timestamp,
      @HiveField(1) double slow,
      @HiveField(2) double medium,
      @HiveField(3) double fast});
}

/// @nodoc
class _$FeesCopyWithImpl<$Res> implements $FeesCopyWith<$Res> {
  _$FeesCopyWithImpl(this._value, this._then);

  final Fees _value;
  // ignore: unused_field
  final $Res Function(Fees) _then;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? slow = freezed,
    Object? medium = freezed,
    Object? fast = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      slow: slow == freezed
          ? _value.slow
          : slow // ignore: cast_nullable_to_non_nullable
              as double,
      medium: medium == freezed
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as double,
      fast: fast == freezed
          ? _value.fast
          : fast // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$FeesCopyWith<$Res> implements $FeesCopyWith<$Res> {
  factory _$FeesCopyWith(_Fees value, $Res Function(_Fees) then) =
      __$FeesCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int timestamp,
      @HiveField(1) double slow,
      @HiveField(2) double medium,
      @HiveField(3) double fast});
}

/// @nodoc
class __$FeesCopyWithImpl<$Res> extends _$FeesCopyWithImpl<$Res>
    implements _$FeesCopyWith<$Res> {
  __$FeesCopyWithImpl(_Fees _value, $Res Function(_Fees) _then)
      : super(_value, (v) => _then(v as _Fees));

  @override
  _Fees get _value => super._value as _Fees;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? slow = freezed,
    Object? medium = freezed,
    Object? fast = freezed,
  }) {
    return _then(_Fees(
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      slow: slow == freezed
          ? _value.slow
          : slow // ignore: cast_nullable_to_non_nullable
              as double,
      medium: medium == freezed
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as double,
      fast: fast == freezed
          ? _value.fast
          : fast // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 5, adapterName: 'FeesClassAdapter')
class _$_Fees extends _Fees {
  const _$_Fees(
      {@HiveField(0) required this.timestamp,
      @HiveField(1) required this.slow,
      @HiveField(2) required this.medium,
      @HiveField(3) required this.fast})
      : super._();

  factory _$_Fees.fromJson(Map<String, dynamic> json) => _$$_FeesFromJson(json);

  @override
  @HiveField(0)
  final int timestamp;
  @override
  @HiveField(1)
  final double slow;
  @override
  @HiveField(2)
  final double medium;
  @override
  @HiveField(3)
  final double fast;

  @override
  String toString() {
    return 'Fees(timestamp: $timestamp, slow: $slow, medium: $medium, fast: $fast)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Fees &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.slow, slow) ||
                const DeepCollectionEquality().equals(other.slow, slow)) &&
            (identical(other.medium, medium) ||
                const DeepCollectionEquality().equals(other.medium, medium)) &&
            (identical(other.fast, fast) ||
                const DeepCollectionEquality().equals(other.fast, fast)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(slow) ^
      const DeepCollectionEquality().hash(medium) ^
      const DeepCollectionEquality().hash(fast);

  @JsonKey(ignore: true)
  @override
  _$FeesCopyWith<_Fees> get copyWith =>
      __$FeesCopyWithImpl<_Fees>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeesToJson(this);
  }
}

abstract class _Fees extends Fees {
  const factory _Fees(
      {@HiveField(0) required int timestamp,
      @HiveField(1) required double slow,
      @HiveField(2) required double medium,
      @HiveField(3) required double fast}) = _$_Fees;
  const _Fees._() : super._();

  factory _Fees.fromJson(Map<String, dynamic> json) = _$_Fees.fromJson;

  @override
  @HiveField(0)
  int get timestamp => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  double get slow => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  double get medium => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  double get fast => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FeesCopyWith<_Fees> get copyWith => throw _privateConstructorUsedError;
}
