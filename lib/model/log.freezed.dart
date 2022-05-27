// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Log _$LogFromJson(Map<String, dynamic> json) {
  return _Log.fromJson(json);
}

/// @nodoc
mixin _$Log {
  LogType get type => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  String? get response => throw _privateConstructorUsedError;
  String? get statusCode => throw _privateConstructorUsedError;
  String? get bloc => throw _privateConstructorUsedError;
  String? get event => throw _privateConstructorUsedError;
  String? get exceptionType => throw _privateConstructorUsedError;
  String? get exceptionSource => throw _privateConstructorUsedError;
  String? get stackTrace => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogCopyWith<Log> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogCopyWith<$Res> {
  factory $LogCopyWith(Log value, $Res Function(Log) then) =
      _$LogCopyWithImpl<$Res>;
  $Res call(
      {LogType type,
      String? path,
      String? response,
      String? statusCode,
      String? bloc,
      String? event,
      String? exceptionType,
      String? exceptionSource,
      String? stackTrace});
}

/// @nodoc
class _$LogCopyWithImpl<$Res> implements $LogCopyWith<$Res> {
  _$LogCopyWithImpl(this._value, this._then);

  final Log _value;
  // ignore: unused_field
  final $Res Function(Log) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? path = freezed,
    Object? response = freezed,
    Object? statusCode = freezed,
    Object? bloc = freezed,
    Object? event = freezed,
    Object? exceptionType = freezed,
    Object? exceptionSource = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LogType,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      response: response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bloc: bloc == freezed
          ? _value.bloc
          : bloc // ignore: cast_nullable_to_non_nullable
              as String?,
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String?,
      exceptionType: exceptionType == freezed
          ? _value.exceptionType
          : exceptionType // ignore: cast_nullable_to_non_nullable
              as String?,
      exceptionSource: exceptionSource == freezed
          ? _value.exceptionSource
          : exceptionSource // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_LogCopyWith<$Res> implements $LogCopyWith<$Res> {
  factory _$$_LogCopyWith(_$_Log value, $Res Function(_$_Log) then) =
      __$$_LogCopyWithImpl<$Res>;
  @override
  $Res call(
      {LogType type,
      String? path,
      String? response,
      String? statusCode,
      String? bloc,
      String? event,
      String? exceptionType,
      String? exceptionSource,
      String? stackTrace});
}

/// @nodoc
class __$$_LogCopyWithImpl<$Res> extends _$LogCopyWithImpl<$Res>
    implements _$$_LogCopyWith<$Res> {
  __$$_LogCopyWithImpl(_$_Log _value, $Res Function(_$_Log) _then)
      : super(_value, (v) => _then(v as _$_Log));

  @override
  _$_Log get _value => super._value as _$_Log;

  @override
  $Res call({
    Object? type = freezed,
    Object? path = freezed,
    Object? response = freezed,
    Object? statusCode = freezed,
    Object? bloc = freezed,
    Object? event = freezed,
    Object? exceptionType = freezed,
    Object? exceptionSource = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$_Log(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LogType,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      response: response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bloc: bloc == freezed
          ? _value.bloc
          : bloc // ignore: cast_nullable_to_non_nullable
              as String?,
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String?,
      exceptionType: exceptionType == freezed
          ? _value.exceptionType
          : exceptionType // ignore: cast_nullable_to_non_nullable
              as String?,
      exceptionSource: exceptionSource == freezed
          ? _value.exceptionSource
          : exceptionSource // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: stackTrace == freezed
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Log with DiagnosticableTreeMixin implements _Log {
  const _$_Log(
      {required this.type,
      this.path,
      this.response,
      this.statusCode,
      this.bloc,
      this.event,
      this.exceptionType,
      this.exceptionSource,
      this.stackTrace});

  factory _$_Log.fromJson(Map<String, dynamic> json) => _$$_LogFromJson(json);

  @override
  final LogType type;
  @override
  final String? path;
  @override
  final String? response;
  @override
  final String? statusCode;
  @override
  final String? bloc;
  @override
  final String? event;
  @override
  final String? exceptionType;
  @override
  final String? exceptionSource;
  @override
  final String? stackTrace;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Log(type: $type, path: $path, response: $response, statusCode: $statusCode, bloc: $bloc, event: $event, exceptionType: $exceptionType, exceptionSource: $exceptionSource, stackTrace: $stackTrace)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Log'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('path', path))
      ..add(DiagnosticsProperty('response', response))
      ..add(DiagnosticsProperty('statusCode', statusCode))
      ..add(DiagnosticsProperty('bloc', bloc))
      ..add(DiagnosticsProperty('event', event))
      ..add(DiagnosticsProperty('exceptionType', exceptionType))
      ..add(DiagnosticsProperty('exceptionSource', exceptionSource))
      ..add(DiagnosticsProperty('stackTrace', stackTrace));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Log &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.path, path) &&
            const DeepCollectionEquality().equals(other.response, response) &&
            const DeepCollectionEquality()
                .equals(other.statusCode, statusCode) &&
            const DeepCollectionEquality().equals(other.bloc, bloc) &&
            const DeepCollectionEquality().equals(other.event, event) &&
            const DeepCollectionEquality()
                .equals(other.exceptionType, exceptionType) &&
            const DeepCollectionEquality()
                .equals(other.exceptionSource, exceptionSource) &&
            const DeepCollectionEquality()
                .equals(other.stackTrace, stackTrace));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(path),
      const DeepCollectionEquality().hash(response),
      const DeepCollectionEquality().hash(statusCode),
      const DeepCollectionEquality().hash(bloc),
      const DeepCollectionEquality().hash(event),
      const DeepCollectionEquality().hash(exceptionType),
      const DeepCollectionEquality().hash(exceptionSource),
      const DeepCollectionEquality().hash(stackTrace));

  @JsonKey(ignore: true)
  @override
  _$$_LogCopyWith<_$_Log> get copyWith =>
      __$$_LogCopyWithImpl<_$_Log>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LogToJson(this);
  }
}

abstract class _Log implements Log {
  const factory _Log(
      {required final LogType type,
      final String? path,
      final String? response,
      final String? statusCode,
      final String? bloc,
      final String? event,
      final String? exceptionType,
      final String? exceptionSource,
      final String? stackTrace}) = _$_Log;

  factory _Log.fromJson(Map<String, dynamic> json) = _$_Log.fromJson;

  @override
  LogType get type => throw _privateConstructorUsedError;
  @override
  String? get path => throw _privateConstructorUsedError;
  @override
  String? get response => throw _privateConstructorUsedError;
  @override
  String? get statusCode => throw _privateConstructorUsedError;
  @override
  String? get bloc => throw _privateConstructorUsedError;
  @override
  String? get event => throw _privateConstructorUsedError;
  @override
  String? get exceptionType => throw _privateConstructorUsedError;
  @override
  String? get exceptionSource => throw _privateConstructorUsedError;
  @override
  String? get stackTrace => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LogCopyWith<_$_Log> get copyWith => throw _privateConstructorUsedError;
}
