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
mixin _$PinState {
  String? get value => throw _privateConstructorUsedError;
  int get attemptsLeft => throw _privateConstructorUsedError;
  int get lastFailure => throw _privateConstructorUsedError;
  bool get isLocked => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  String get chosenValue => throw _privateConstructorUsedError;
  String get confirmedValue => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PinStateCopyWith<PinState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PinStateCopyWith<$Res> {
  factory $PinStateCopyWith(PinState value, $Res Function(PinState) then) =
      _$PinStateCopyWithImpl<$Res>;
  $Res call(
      {String? value,
      int attemptsLeft,
      int lastFailure,
      bool isLocked,
      bool isVerified,
      String chosenValue,
      String confirmedValue,
      String? error});
}

/// @nodoc
class _$PinStateCopyWithImpl<$Res> implements $PinStateCopyWith<$Res> {
  _$PinStateCopyWithImpl(this._value, this._then);

  final PinState _value;
  // ignore: unused_field
  final $Res Function(PinState) _then;

  @override
  $Res call({
    Object? value = freezed,
    Object? attemptsLeft = freezed,
    Object? lastFailure = freezed,
    Object? isLocked = freezed,
    Object? isVerified = freezed,
    Object? chosenValue = freezed,
    Object? confirmedValue = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isVerified: isVerified == freezed
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      chosenValue: chosenValue == freezed
          ? _value.chosenValue
          : chosenValue // ignore: cast_nullable_to_non_nullable
              as String,
      confirmedValue: confirmedValue == freezed
          ? _value.confirmedValue
          : confirmedValue // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_PinStateCopyWith<$Res> implements $PinStateCopyWith<$Res> {
  factory _$$_PinStateCopyWith(
          _$_PinState value, $Res Function(_$_PinState) then) =
      __$$_PinStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? value,
      int attemptsLeft,
      int lastFailure,
      bool isLocked,
      bool isVerified,
      String chosenValue,
      String confirmedValue,
      String? error});
}

/// @nodoc
class __$$_PinStateCopyWithImpl<$Res> extends _$PinStateCopyWithImpl<$Res>
    implements _$$_PinStateCopyWith<$Res> {
  __$$_PinStateCopyWithImpl(
      _$_PinState _value, $Res Function(_$_PinState) _then)
      : super(_value, (v) => _then(v as _$_PinState));

  @override
  _$_PinState get _value => super._value as _$_PinState;

  @override
  $Res call({
    Object? value = freezed,
    Object? attemptsLeft = freezed,
    Object? lastFailure = freezed,
    Object? isLocked = freezed,
    Object? isVerified = freezed,
    Object? chosenValue = freezed,
    Object? confirmedValue = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_PinState(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isVerified: isVerified == freezed
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      chosenValue: chosenValue == freezed
          ? _value.chosenValue
          : chosenValue // ignore: cast_nullable_to_non_nullable
              as String,
      confirmedValue: confirmedValue == freezed
          ? _value.confirmedValue
          : confirmedValue // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PinState extends _PinState {
  const _$_PinState(
      {this.value,
      this.attemptsLeft = 3,
      this.lastFailure = 0,
      this.isLocked = false,
      this.isVerified = false,
      this.chosenValue = '',
      this.confirmedValue = '',
      this.error})
      : super._();

  @override
  final String? value;
  @override
  @JsonKey()
  final int attemptsLeft;
  @override
  @JsonKey()
  final int lastFailure;
  @override
  @JsonKey()
  final bool isLocked;
  @override
  @JsonKey()
  final bool isVerified;
  @override
  @JsonKey()
  final String chosenValue;
  @override
  @JsonKey()
  final String confirmedValue;
  @override
  final String? error;

  @override
  String toString() {
    return 'PinState(value: $value, attemptsLeft: $attemptsLeft, lastFailure: $lastFailure, isLocked: $isLocked, isVerified: $isVerified, chosenValue: $chosenValue, confirmedValue: $confirmedValue, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PinState &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality()
                .equals(other.attemptsLeft, attemptsLeft) &&
            const DeepCollectionEquality()
                .equals(other.lastFailure, lastFailure) &&
            const DeepCollectionEquality().equals(other.isLocked, isLocked) &&
            const DeepCollectionEquality()
                .equals(other.isVerified, isVerified) &&
            const DeepCollectionEquality()
                .equals(other.chosenValue, chosenValue) &&
            const DeepCollectionEquality()
                .equals(other.confirmedValue, confirmedValue) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(attemptsLeft),
      const DeepCollectionEquality().hash(lastFailure),
      const DeepCollectionEquality().hash(isLocked),
      const DeepCollectionEquality().hash(isVerified),
      const DeepCollectionEquality().hash(chosenValue),
      const DeepCollectionEquality().hash(confirmedValue),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_PinStateCopyWith<_$_PinState> get copyWith =>
      __$$_PinStateCopyWithImpl<_$_PinState>(this, _$identity);
}

abstract class _PinState extends PinState {
  const factory _PinState(
      {final String? value,
      final int attemptsLeft,
      final int lastFailure,
      final bool isLocked,
      final bool isVerified,
      final String chosenValue,
      final String confirmedValue,
      final String? error}) = _$_PinState;
  const _PinState._() : super._();

  @override
  String? get value => throw _privateConstructorUsedError;
  @override
  int get attemptsLeft => throw _privateConstructorUsedError;
  @override
  int get lastFailure => throw _privateConstructorUsedError;
  @override
  bool get isLocked => throw _privateConstructorUsedError;
  @override
  bool get isVerified => throw _privateConstructorUsedError;
  @override
  String get chosenValue => throw _privateConstructorUsedError;
  @override
  String get confirmedValue => throw _privateConstructorUsedError;
  @override
  String? get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PinStateCopyWith<_$_PinState> get copyWith =>
      throw _privateConstructorUsedError;
}
