// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$PinCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String value,
      @HiveField(1) int attemptsLeft,
      @HiveField(2) int lastFailure,
      @HiveField(3) bool isLocked});
}

/// @nodoc
class _$PinCopyWithImpl<$Res> implements $PinCopyWith<$Res> {
  _$PinCopyWithImpl(this._value, this._then);

  final Pin _value;
  // ignore: unused_field
  final $Res Function(Pin) _then;

  @override
  $Res call({
    Object? value = freezed,
    Object? attemptsLeft = freezed,
    Object? lastFailure = freezed,
    Object? isLocked = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      attemptsLeft: attemptsLeft == freezed
          ? _value.attemptsLeft
          : attemptsLeft // ignore: cast_nullable_to_non_nullable
              as int,
      lastFailure: lastFailure == freezed
          ? _value.lastFailure
          : lastFailure // ignore: cast_nullable_to_non_nullable
              as int,
      isLocked: isLocked == freezed
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_PinCopyWith<$Res> implements $PinCopyWith<$Res> {
  factory _$$_PinCopyWith(_$_Pin value, $Res Function(_$_Pin) then) =
      __$$_PinCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String value,
      @HiveField(1) int attemptsLeft,
      @HiveField(2) int lastFailure,
      @HiveField(3) bool isLocked});
}

/// @nodoc
class __$$_PinCopyWithImpl<$Res> extends _$PinCopyWithImpl<$Res>
    implements _$$_PinCopyWith<$Res> {
  __$$_PinCopyWithImpl(_$_Pin _value, $Res Function(_$_Pin) _then)
      : super(_value, (v) => _then(v as _$_Pin));

  @override
  _$_Pin get _value => super._value as _$_Pin;

  @override
  $Res call({
    Object? value = freezed,
    Object? attemptsLeft = freezed,
    Object? lastFailure = freezed,
    Object? isLocked = freezed,
  }) {
    return _then(_$_Pin(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      attemptsLeft: attemptsLeft == freezed
          ? _value.attemptsLeft
          : attemptsLeft // ignore: cast_nullable_to_non_nullable
              as int,
      lastFailure: lastFailure == freezed
          ? _value.lastFailure
          : lastFailure // ignore: cast_nullable_to_non_nullable
              as int,
      isLocked: isLocked == freezed
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 9, adapterName: 'PinClassAdapter')
class _$_Pin extends _Pin {
  const _$_Pin(
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
            other is _$_Pin &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality()
                .equals(other.attemptsLeft, attemptsLeft) &&
            const DeepCollectionEquality()
                .equals(other.lastFailure, lastFailure) &&
            const DeepCollectionEquality().equals(other.isLocked, isLocked));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(attemptsLeft),
      const DeepCollectionEquality().hash(lastFailure),
      const DeepCollectionEquality().hash(isLocked));

  @JsonKey(ignore: true)
  @override
  _$$_PinCopyWith<_$_Pin> get copyWith =>
      __$$_PinCopyWithImpl<_$_Pin>(this, _$identity);
}

abstract class _Pin extends Pin {
  const factory _Pin(
      {@HiveField(0) required final String value,
      @HiveField(1) required final int attemptsLeft,
      @HiveField(2) required final int lastFailure,
      @HiveField(3) required final bool isLocked}) = _$_Pin;
  const _Pin._() : super._();

  @override
  @HiveField(0)
  String get value => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  int get attemptsLeft => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  int get lastFailure => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  bool get isLocked => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PinCopyWith<_$_Pin> get copyWith => throw _privateConstructorUsedError;
}
