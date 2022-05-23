// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TorState {
  int get port => throw _privateConstructorUsedError;
  bool get isRunning => throw _privateConstructorUsedError;
  String get errConnection => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TorStateCopyWith<TorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TorStateCopyWith<$Res> {
  factory $TorStateCopyWith(TorState value, $Res Function(TorState) then) =
      _$TorStateCopyWithImpl<$Res>;
  $Res call({int port, bool isRunning, String errConnection});
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
    Object? errConnection = freezed,
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
      errConnection: errConnection == freezed
          ? _value.errConnection
          : errConnection // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TorStateCopyWith<$Res> implements $TorStateCopyWith<$Res> {
  factory _$$_TorStateCopyWith(
          _$_TorState value, $Res Function(_$_TorState) then) =
      __$$_TorStateCopyWithImpl<$Res>;
  @override
  $Res call({int port, bool isRunning, String errConnection});
}

/// @nodoc
class __$$_TorStateCopyWithImpl<$Res> extends _$TorStateCopyWithImpl<$Res>
    implements _$$_TorStateCopyWith<$Res> {
  __$$_TorStateCopyWithImpl(
      _$_TorState _value, $Res Function(_$_TorState) _then)
      : super(_value, (v) => _then(v as _$_TorState));

  @override
  _$_TorState get _value => super._value as _$_TorState;

  @override
  $Res call({
    Object? port = freezed,
    Object? isRunning = freezed,
    Object? errConnection = freezed,
  }) {
    return _then(_$_TorState(
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      isRunning: isRunning == freezed
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      errConnection: errConnection == freezed
          ? _value.errConnection
          : errConnection // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TorState extends _TorState {
  const _$_TorState(
      {this.port = 0, this.isRunning = false, this.errConnection = ''})
      : super._();

  @override
  @JsonKey()
  final int port;
  @override
  @JsonKey()
  final bool isRunning;
  @override
  @JsonKey()
  final String errConnection;

  @override
  String toString() {
    return 'TorState(port: $port, isRunning: $isRunning, errConnection: $errConnection)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TorState &&
            const DeepCollectionEquality().equals(other.port, port) &&
            const DeepCollectionEquality().equals(other.isRunning, isRunning) &&
            const DeepCollectionEquality()
                .equals(other.errConnection, errConnection));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(port),
      const DeepCollectionEquality().hash(isRunning),
      const DeepCollectionEquality().hash(errConnection));

  @JsonKey(ignore: true)
  @override
  _$$_TorStateCopyWith<_$_TorState> get copyWith =>
      __$$_TorStateCopyWithImpl<_$_TorState>(this, _$identity);
}

abstract class _TorState extends TorState {
  const factory _TorState(
      {final int port,
      final bool isRunning,
      final String errConnection}) = _$_TorState;
  const _TorState._() : super._();

  @override
  int get port => throw _privateConstructorUsedError;
  @override
  bool get isRunning => throw _privateConstructorUsedError;
  @override
  String get errConnection => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TorStateCopyWith<_$_TorState> get copyWith =>
      throw _privateConstructorUsedError;
}
