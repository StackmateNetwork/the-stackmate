// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$LogCopyWithImpl<$Res, Log>;
  @useResult
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
class _$LogCopyWithImpl<$Res, $Val extends Log> implements $LogCopyWith<$Res> {
  _$LogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LogType,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bloc: freezed == bloc
          ? _value.bloc
          : bloc // ignore: cast_nullable_to_non_nullable
              as String?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String?,
      exceptionType: freezed == exceptionType
          ? _value.exceptionType
          : exceptionType // ignore: cast_nullable_to_non_nullable
              as String?,
      exceptionSource: freezed == exceptionSource
          ? _value.exceptionSource
          : exceptionSource // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogImplCopyWith<$Res> implements $LogCopyWith<$Res> {
  factory _$$LogImplCopyWith(_$LogImpl value, $Res Function(_$LogImpl) then) =
      __$$LogImplCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$LogImplCopyWithImpl<$Res> extends _$LogCopyWithImpl<$Res, _$LogImpl>
    implements _$$LogImplCopyWith<$Res> {
  __$$LogImplCopyWithImpl(_$LogImpl _value, $Res Function(_$LogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? path = freezed,
    Object? response = freezed,
    Object? statusCode = freezed,
    Object? bloc = freezed,
    Object? event = freezed,
    Object? exceptionType = freezed,
    Object? exceptionSource = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$LogImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LogType,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      bloc: freezed == bloc
          ? _value.bloc
          : bloc // ignore: cast_nullable_to_non_nullable
              as String?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String?,
      exceptionType: freezed == exceptionType
          ? _value.exceptionType
          : exceptionType // ignore: cast_nullable_to_non_nullable
              as String?,
      exceptionSource: freezed == exceptionSource
          ? _value.exceptionSource
          : exceptionSource // ignore: cast_nullable_to_non_nullable
              as String?,
      stackTrace: freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogImpl with DiagnosticableTreeMixin implements _Log {
  const _$LogImpl(
      {required this.type,
      this.path,
      this.response,
      this.statusCode,
      this.bloc,
      this.event,
      this.exceptionType,
      this.exceptionSource,
      this.stackTrace});

  factory _$LogImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogImplFromJson(json);

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
            other is _$LogImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.bloc, bloc) || other.bloc == bloc) &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.exceptionType, exceptionType) ||
                other.exceptionType == exceptionType) &&
            (identical(other.exceptionSource, exceptionSource) ||
                other.exceptionSource == exceptionSource) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, path, response, statusCode,
      bloc, event, exceptionType, exceptionSource, stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogImplCopyWith<_$LogImpl> get copyWith =>
      __$$LogImplCopyWithImpl<_$LogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogImplToJson(
      this,
    );
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
      final String? stackTrace}) = _$LogImpl;

  factory _Log.fromJson(Map<String, dynamic> json) = _$LogImpl.fromJson;

  @override
  LogType get type;
  @override
  String? get path;
  @override
  String? get response;
  @override
  String? get statusCode;
  @override
  String? get bloc;
  @override
  String? get event;
  @override
  String? get exceptionType;
  @override
  String? get exceptionSource;
  @override
  String? get stackTrace;
  @override
  @JsonKey(ignore: true)
  _$$LogImplCopyWith<_$LogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
