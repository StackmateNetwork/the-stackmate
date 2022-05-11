// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TorStateTearOff {
  const _$TorStateTearOff();

  _TorState call({int port = 9150, bool isRunning = false}) {
    return _TorState(
      port: port,
      isRunning: isRunning,
    );
  }
}

/// @nodoc
const $TorState = _$TorStateTearOff();

/// @nodoc
mixin _$TorState {
  int get port => throw _privateConstructorUsedError;
  bool get isRunning => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TorStateCopyWith<TorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TorStateCopyWith<$Res> {
  factory $TorStateCopyWith(TorState value, $Res Function(TorState) then) =
      _$TorStateCopyWithImpl<$Res>;
  $Res call({int port, bool isRunning});
}

/// @nodoc
class _$TorStateCopyWithImpl<$Res> implements $TorStateCopyWith<$Res> {
  _$TorStateCopyWithImpl(this._value, this._then);

  final TorState _value;
  // ignore: unused_field
  final $Res Function(TorState) _then;

  @override
  $Res call({
    Object? port = freezed,
    Object? isRunning = freezed,
  }) {
    return _then(_value.copyWith(
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      isRunning: isRunning == freezed
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$TorStateCopyWith<$Res> implements $TorStateCopyWith<$Res> {
  factory _$TorStateCopyWith(_TorState value, $Res Function(_TorState) then) =
      __$TorStateCopyWithImpl<$Res>;
  @override
  $Res call({int port, bool isRunning});
}

/// @nodoc
class __$TorStateCopyWithImpl<$Res> extends _$TorStateCopyWithImpl<$Res>
    implements _$TorStateCopyWith<$Res> {
  __$TorStateCopyWithImpl(_TorState _value, $Res Function(_TorState) _then)
      : super(_value, (v) => _then(v as _TorState));

  @override
  _TorState get _value => super._value as _TorState;

  @override
  $Res call({
    Object? port = freezed,
    Object? isRunning = freezed,
  }) {
    return _then(_TorState(
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      isRunning: isRunning == freezed
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TorState implements _TorState {
  const _$_TorState({this.port = 9150, this.isRunning = false});

  @JsonKey(defaultValue: 9150)
  @override
  final int port;
  @JsonKey(defaultValue: false)
  @override
  final bool isRunning;

  @override
  String toString() {
    return 'TorState(port: $port, isRunning: $isRunning)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TorState &&
            (identical(other.port, port) ||
                const DeepCollectionEquality().equals(other.port, port)) &&
            (identical(other.isRunning, isRunning) ||
                const DeepCollectionEquality()
                    .equals(other.isRunning, isRunning)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(port) ^
      const DeepCollectionEquality().hash(isRunning);

  @JsonKey(ignore: true)
  @override
  _$TorStateCopyWith<_TorState> get copyWith =>
      __$TorStateCopyWithImpl<_TorState>(this, _$identity);
}

abstract class _TorState implements TorState {
  const factory _TorState({int port, bool isRunning}) = _$_TorState;

  @override
  int get port => throw _privateConstructorUsedError;
  @override
  bool get isRunning => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TorStateCopyWith<_TorState> get copyWith =>
      throw _privateConstructorUsedError;
}
