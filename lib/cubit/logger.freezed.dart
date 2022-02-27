// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'logger.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoggerStateTearOff {
  const _$LoggerStateTearOff();

  _LoggerState call({List<Log> logs = const []}) {
    return _LoggerState(
      logs: logs,
    );
  }
}

/// @nodoc
const $LoggerState = _$LoggerStateTearOff();

/// @nodoc
mixin _$LoggerState {
  List<Log> get logs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoggerStateCopyWith<LoggerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoggerStateCopyWith<$Res> {
  factory $LoggerStateCopyWith(
          LoggerState value, $Res Function(LoggerState) then) =
      _$LoggerStateCopyWithImpl<$Res>;
  $Res call({List<Log> logs});
}

/// @nodoc
class _$LoggerStateCopyWithImpl<$Res> implements $LoggerStateCopyWith<$Res> {
  _$LoggerStateCopyWithImpl(this._value, this._then);

  final LoggerState _value;
  // ignore: unused_field
  final $Res Function(LoggerState) _then;

  @override
  $Res call({
    Object? logs = freezed,
  }) {
    return _then(_value.copyWith(
      logs: logs == freezed
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<Log>,
    ));
  }
}

/// @nodoc
abstract class _$LoggerStateCopyWith<$Res>
    implements $LoggerStateCopyWith<$Res> {
  factory _$LoggerStateCopyWith(
          _LoggerState value, $Res Function(_LoggerState) then) =
      __$LoggerStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Log> logs});
}

/// @nodoc
class __$LoggerStateCopyWithImpl<$Res> extends _$LoggerStateCopyWithImpl<$Res>
    implements _$LoggerStateCopyWith<$Res> {
  __$LoggerStateCopyWithImpl(
      _LoggerState _value, $Res Function(_LoggerState) _then)
      : super(_value, (v) => _then(v as _LoggerState));

  @override
  _LoggerState get _value => super._value as _LoggerState;

  @override
  $Res call({
    Object? logs = freezed,
  }) {
    return _then(_LoggerState(
      logs: logs == freezed
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<Log>,
    ));
  }
}

/// @nodoc

class _$_LoggerState with DiagnosticableTreeMixin implements _LoggerState {
  const _$_LoggerState({this.logs = const []});

  @JsonKey(defaultValue: const [])
  @override
  final List<Log> logs;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoggerState(logs: $logs)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoggerState'))
      ..add(DiagnosticsProperty('logs', logs));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoggerState &&
            (identical(other.logs, logs) ||
                const DeepCollectionEquality().equals(other.logs, logs)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(logs);

  @JsonKey(ignore: true)
  @override
  _$LoggerStateCopyWith<_LoggerState> get copyWith =>
      __$LoggerStateCopyWithImpl<_LoggerState>(this, _$identity);
}

abstract class _LoggerState implements LoggerState {
  const factory _LoggerState({List<Log> logs}) = _$_LoggerState;

  @override
  List<Log> get logs => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoggerStateCopyWith<_LoggerState> get copyWith =>
      throw _privateConstructorUsedError;
}
