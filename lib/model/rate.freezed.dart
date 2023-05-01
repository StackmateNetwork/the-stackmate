// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Rate _$RateFromJson(Map<String, dynamic> json) {
  return _Rate.fromJson(json);
}

/// @nodoc
mixin _$Rate {
  String get symbol => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RateCopyWith<Rate> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RateCopyWith<$Res> {
  factory $RateCopyWith(Rate value, $Res Function(Rate) then) =
      _$RateCopyWithImpl<$Res, Rate>;
  @useResult
  $Res call({String symbol, String name, double rate});
}

/// @nodoc
class _$RateCopyWithImpl<$Res, $Val extends Rate>
    implements $RateCopyWith<$Res> {
  _$RateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? name = null,
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RateCopyWith<$Res> implements $RateCopyWith<$Res> {
  factory _$$_RateCopyWith(_$_Rate value, $Res Function(_$_Rate) then) =
      __$$_RateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String symbol, String name, double rate});
}

/// @nodoc
class __$$_RateCopyWithImpl<$Res> extends _$RateCopyWithImpl<$Res, _$_Rate>
    implements _$$_RateCopyWith<$Res> {
  __$$_RateCopyWithImpl(_$_Rate _value, $Res Function(_$_Rate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? name = null,
    Object? rate = null,
  }) {
    return _then(_$_Rate(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Rate implements _Rate {
  const _$_Rate({required this.symbol, required this.name, required this.rate});

  factory _$_Rate.fromJson(Map<String, dynamic> json) => _$$_RateFromJson(json);

  @override
  final String symbol;
  @override
  final String name;
  @override
  final double rate;

  @override
  String toString() {
    return 'Rate(symbol: $symbol, name: $name, rate: $rate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Rate &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, symbol, name, rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RateCopyWith<_$_Rate> get copyWith =>
      __$$_RateCopyWithImpl<_$_Rate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RateToJson(
      this,
    );
  }
}

abstract class _Rate implements Rate {
  const factory _Rate(
      {required final String symbol,
      required final String name,
      required final double rate}) = _$_Rate;

  factory _Rate.fromJson(Map<String, dynamic> json) = _$_Rate.fromJson;

  @override
  String get symbol;
  @override
  String get name;
  @override
  double get rate;
  @override
  @JsonKey(ignore: true)
  _$$_RateCopyWith<_$_Rate> get copyWith => throw _privateConstructorUsedError;
}
