// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Pin {
  @HiveField(0)
  String get value => throw _privateConstructorUsedError;
  @HiveField(1)
  int get attemptsLeft => throw _privateConstructorUsedError;
  @HiveField(2)
  int get lastFailure => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get isLocked => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PinCopyWith<Pin> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PinCopyWith<$Res> {
  factory $PinCopyWith(Pin value, $Res Function(Pin) then) =
      _$PinCopyWithImpl<$Res, Pin>;
  @useResult
  $Res call(
      {@HiveField(0) String value,
      @HiveField(1) int attemptsLeft,
      @HiveField(2) int lastFailure,
      @HiveField(3) bool isLocked});
}

/// @nodoc
class _$PinCopyWithImpl<$Res, $Val extends Pin> implements $PinCopyWith<$Res> {
  _$PinCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? attemptsLeft = null,
    Object? lastFailure = null,
    Object? isLocked = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      attemptsLeft: null == attemptsLeft
          ? _value.attemptsLeft
          : attemptsLeft // ignore: cast_nullable_to_non_nullable
              as int,
      lastFailure: null == lastFailure
          ? _value.lastFailure
          : lastFailure // ignore: cast_nullable_to_non_nullable
              as int,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PinImplCopyWith<$Res> implements $PinCopyWith<$Res> {
  factory _$$PinImplCopyWith(_$PinImpl value, $Res Function(_$PinImpl) then) =
      __$$PinImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String value,
      @HiveField(1) int attemptsLeft,
      @HiveField(2) int lastFailure,
      @HiveField(3) bool isLocked});
}

/// @nodoc
class __$$PinImplCopyWithImpl<$Res> extends _$PinCopyWithImpl<$Res, _$PinImpl>
    implements _$$PinImplCopyWith<$Res> {
  __$$PinImplCopyWithImpl(_$PinImpl _value, $Res Function(_$PinImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? attemptsLeft = null,
    Object? lastFailure = null,
    Object? isLocked = null,
  }) {
    return _then(_$PinImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      attemptsLeft: null == attemptsLeft
          ? _value.attemptsLeft
          : attemptsLeft // ignore: cast_nullable_to_non_nullable
              as int,
      lastFailure: null == lastFailure
          ? _value.lastFailure
          : lastFailure // ignore: cast_nullable_to_non_nullable
              as int,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 9, adapterName: 'PinClassAdapter')
class _$PinImpl extends _Pin {
  const _$PinImpl(
      {@HiveField(0) required this.value,
      @HiveField(1) required this.attemptsLeft,
      @HiveField(2) required this.lastFailure,
      @HiveField(3) required this.isLocked})
      : super._();

  @override
  @HiveField(0)
  final String value;
  @override
  @HiveField(1)
  final int attemptsLeft;
  @override
  @HiveField(2)
  final int lastFailure;
  @override
  @HiveField(3)
  final bool isLocked;

  @override
  String toString() {
    return 'Pin(value: $value, attemptsLeft: $attemptsLeft, lastFailure: $lastFailure, isLocked: $isLocked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PinImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.attemptsLeft, attemptsLeft) ||
                other.attemptsLeft == attemptsLeft) &&
            (identical(other.lastFailure, lastFailure) ||
                other.lastFailure == lastFailure) &&
            (identical(other.isLocked, isLocked) ||
                other.isLocked == isLocked));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, value, attemptsLeft, lastFailure, isLocked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PinImplCopyWith<_$PinImpl> get copyWith =>
      __$$PinImplCopyWithImpl<_$PinImpl>(this, _$identity);
}

abstract class _Pin extends Pin {
  const factory _Pin(
      {@HiveField(0) required final String value,
      @HiveField(1) required final int attemptsLeft,
      @HiveField(2) required final int lastFailure,
      @HiveField(3) required final bool isLocked}) = _$PinImpl;
  const _Pin._() : super._();

  @override
  @HiveField(0)
  String get value;
  @override
  @HiveField(1)
  int get attemptsLeft;
  @override
  @HiveField(2)
  int get lastFailure;
  @override
  @HiveField(3)
  bool get isLocked;
  @override
  @JsonKey(ignore: true)
  _$$PinImplCopyWith<_$PinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
