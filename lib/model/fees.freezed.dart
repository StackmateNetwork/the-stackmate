// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fees.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Fees _$FeesFromJson(Map<String, dynamic> json) {
  return _Fees.fromJson(json);
}

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
      _$FeesCopyWithImpl<$Res, Fees>;
  @useResult
  $Res call(
      {@HiveField(0) int timestamp,
      @HiveField(1) double slow,
      @HiveField(2) double medium,
      @HiveField(3) double fast});
}

/// @nodoc
class _$FeesCopyWithImpl<$Res, $Val extends Fees>
    implements $FeesCopyWith<$Res> {
  _$FeesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? slow = null,
    Object? medium = null,
    Object? fast = null,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      slow: null == slow
          ? _value.slow
          : slow // ignore: cast_nullable_to_non_nullable
              as double,
      medium: null == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as double,
      fast: null == fast
          ? _value.fast
          : fast // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeesImplCopyWith<$Res> implements $FeesCopyWith<$Res> {
  factory _$$FeesImplCopyWith(
          _$FeesImpl value, $Res Function(_$FeesImpl) then) =
      __$$FeesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int timestamp,
      @HiveField(1) double slow,
      @HiveField(2) double medium,
      @HiveField(3) double fast});
}

/// @nodoc
class __$$FeesImplCopyWithImpl<$Res>
    extends _$FeesCopyWithImpl<$Res, _$FeesImpl>
    implements _$$FeesImplCopyWith<$Res> {
  __$$FeesImplCopyWithImpl(_$FeesImpl _value, $Res Function(_$FeesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? slow = null,
    Object? medium = null,
    Object? fast = null,
  }) {
    return _then(_$FeesImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      slow: null == slow
          ? _value.slow
          : slow // ignore: cast_nullable_to_non_nullable
              as double,
      medium: null == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as double,
      fast: null == fast
          ? _value.fast
          : fast // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 5, adapterName: 'FeesClassAdapter')
class _$FeesImpl extends _Fees {
  const _$FeesImpl(
      {@HiveField(0) required this.timestamp,
      @HiveField(1) required this.slow,
      @HiveField(2) required this.medium,
      @HiveField(3) required this.fast})
      : super._();

  factory _$FeesImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeesImplFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$FeesImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.slow, slow) || other.slow == slow) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.fast, fast) || other.fast == fast));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, timestamp, slow, medium, fast);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeesImplCopyWith<_$FeesImpl> get copyWith =>
      __$$FeesImplCopyWithImpl<_$FeesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeesImplToJson(
      this,
    );
  }
}

abstract class _Fees extends Fees {
  const factory _Fees(
      {@HiveField(0) required final int timestamp,
      @HiveField(1) required final double slow,
      @HiveField(2) required final double medium,
      @HiveField(3) required final double fast}) = _$FeesImpl;
  const _Fees._() : super._();

  factory _Fees.fromJson(Map<String, dynamic> json) = _$FeesImpl.fromJson;

  @override
  @HiveField(0)
  int get timestamp;
  @override
  @HiveField(1)
  double get slow;
  @override
  @HiveField(2)
  double get medium;
  @override
  @HiveField(3)
  double get fast;
  @override
  @JsonKey(ignore: true)
  _$$FeesImplCopyWith<_$FeesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
