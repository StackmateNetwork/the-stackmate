// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logger.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$LoggerStateCopyWithImpl<$Res, LoggerState>;
  @useResult
  $Res call({List<Log> logs});
}

/// @nodoc
class _$LoggerStateCopyWithImpl<$Res, $Val extends LoggerState>
    implements $LoggerStateCopyWith<$Res> {
  _$LoggerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logs = null,
  }) {
    return _then(_value.copyWith(
      logs: null == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<Log>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoggerStateCopyWith<$Res>
    implements $LoggerStateCopyWith<$Res> {
  factory _$$_LoggerStateCopyWith(
          _$_LoggerState value, $Res Function(_$_LoggerState) then) =
      __$$_LoggerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Log> logs});
}

/// @nodoc
class __$$_LoggerStateCopyWithImpl<$Res>
    extends _$LoggerStateCopyWithImpl<$Res, _$_LoggerState>
    implements _$$_LoggerStateCopyWith<$Res> {
  __$$_LoggerStateCopyWithImpl(
      _$_LoggerState _value, $Res Function(_$_LoggerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logs = null,
  }) {
    return _then(_$_LoggerState(
      logs: null == logs
          ? _value._logs
          : logs // ignore: cast_nullable_to_non_nullable
              as List<Log>,
    ));
  }
}

/// @nodoc

class _$_LoggerState with DiagnosticableTreeMixin implements _LoggerState {
  const _$_LoggerState({final List<Log> logs = const []}) : _logs = logs;

  final List<Log> _logs;
  @override
  @JsonKey()
  List<Log> get logs {
    if (_logs is EqualUnmodifiableListView) return _logs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_logs);
  }

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
        (other.runtimeType == runtimeType &&
            other is _$_LoggerState &&
            const DeepCollectionEquality().equals(other._logs, _logs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_logs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoggerStateCopyWith<_$_LoggerState> get copyWith =>
      __$$_LoggerStateCopyWithImpl<_$_LoggerState>(this, _$identity);
}

abstract class _LoggerState implements LoggerState {
  const factory _LoggerState({final List<Log> logs}) = _$_LoggerState;

  @override
  List<Log> get logs;
  @override
  @JsonKey(ignore: true)
  _$$_LoggerStateCopyWith<_$_LoggerState> get copyWith =>
      throw _privateConstructorUsedError;
}
