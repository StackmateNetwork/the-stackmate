// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Log implements DiagnosticableTreeMixin {

 LogType get type; String? get path; String? get response; String? get statusCode; String? get bloc; String? get event; String? get exceptionType; String? get exceptionSource; String? get stackTrace;
/// Create a copy of Log
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogCopyWith<Log> get copyWith => _$LogCopyWithImpl<Log>(this as Log, _$identity);

  /// Serializes this Log to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Log'))
    ..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('path', path))..add(DiagnosticsProperty('response', response))..add(DiagnosticsProperty('statusCode', statusCode))..add(DiagnosticsProperty('bloc', bloc))..add(DiagnosticsProperty('event', event))..add(DiagnosticsProperty('exceptionType', exceptionType))..add(DiagnosticsProperty('exceptionSource', exceptionSource))..add(DiagnosticsProperty('stackTrace', stackTrace));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Log&&(identical(other.type, type) || other.type == type)&&(identical(other.path, path) || other.path == path)&&(identical(other.response, response) || other.response == response)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.bloc, bloc) || other.bloc == bloc)&&(identical(other.event, event) || other.event == event)&&(identical(other.exceptionType, exceptionType) || other.exceptionType == exceptionType)&&(identical(other.exceptionSource, exceptionSource) || other.exceptionSource == exceptionSource)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,path,response,statusCode,bloc,event,exceptionType,exceptionSource,stackTrace);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Log(type: $type, path: $path, response: $response, statusCode: $statusCode, bloc: $bloc, event: $event, exceptionType: $exceptionType, exceptionSource: $exceptionSource, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $LogCopyWith<$Res>  {
  factory $LogCopyWith(Log value, $Res Function(Log) _then) = _$LogCopyWithImpl;
@useResult
$Res call({
 LogType type, String? path, String? response, String? statusCode, String? bloc, String? event, String? exceptionType, String? exceptionSource, String? stackTrace
});




}
/// @nodoc
class _$LogCopyWithImpl<$Res>
    implements $LogCopyWith<$Res> {
  _$LogCopyWithImpl(this._self, this._then);

  final Log _self;
  final $Res Function(Log) _then;

/// Create a copy of Log
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? path = freezed,Object? response = freezed,Object? statusCode = freezed,Object? bloc = freezed,Object? event = freezed,Object? exceptionType = freezed,Object? exceptionSource = freezed,Object? stackTrace = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as LogType,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as String?,bloc: freezed == bloc ? _self.bloc : bloc // ignore: cast_nullable_to_non_nullable
as String?,event: freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as String?,exceptionType: freezed == exceptionType ? _self.exceptionType : exceptionType // ignore: cast_nullable_to_non_nullable
as String?,exceptionSource: freezed == exceptionSource ? _self.exceptionSource : exceptionSource // ignore: cast_nullable_to_non_nullable
as String?,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Log].
extension LogPatterns on Log {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Log value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Log() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Log value)  $default,){
final _that = this;
switch (_that) {
case _Log():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Log value)?  $default,){
final _that = this;
switch (_that) {
case _Log() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LogType type,  String? path,  String? response,  String? statusCode,  String? bloc,  String? event,  String? exceptionType,  String? exceptionSource,  String? stackTrace)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Log() when $default != null:
return $default(_that.type,_that.path,_that.response,_that.statusCode,_that.bloc,_that.event,_that.exceptionType,_that.exceptionSource,_that.stackTrace);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LogType type,  String? path,  String? response,  String? statusCode,  String? bloc,  String? event,  String? exceptionType,  String? exceptionSource,  String? stackTrace)  $default,) {final _that = this;
switch (_that) {
case _Log():
return $default(_that.type,_that.path,_that.response,_that.statusCode,_that.bloc,_that.event,_that.exceptionType,_that.exceptionSource,_that.stackTrace);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LogType type,  String? path,  String? response,  String? statusCode,  String? bloc,  String? event,  String? exceptionType,  String? exceptionSource,  String? stackTrace)?  $default,) {final _that = this;
switch (_that) {
case _Log() when $default != null:
return $default(_that.type,_that.path,_that.response,_that.statusCode,_that.bloc,_that.event,_that.exceptionType,_that.exceptionSource,_that.stackTrace);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Log with DiagnosticableTreeMixin implements Log {
  const _Log({required this.type, this.path, this.response, this.statusCode, this.bloc, this.event, this.exceptionType, this.exceptionSource, this.stackTrace});
  factory _Log.fromJson(Map<String, dynamic> json) => _$LogFromJson(json);

@override final  LogType type;
@override final  String? path;
@override final  String? response;
@override final  String? statusCode;
@override final  String? bloc;
@override final  String? event;
@override final  String? exceptionType;
@override final  String? exceptionSource;
@override final  String? stackTrace;

/// Create a copy of Log
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogCopyWith<_Log> get copyWith => __$LogCopyWithImpl<_Log>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Log'))
    ..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('path', path))..add(DiagnosticsProperty('response', response))..add(DiagnosticsProperty('statusCode', statusCode))..add(DiagnosticsProperty('bloc', bloc))..add(DiagnosticsProperty('event', event))..add(DiagnosticsProperty('exceptionType', exceptionType))..add(DiagnosticsProperty('exceptionSource', exceptionSource))..add(DiagnosticsProperty('stackTrace', stackTrace));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Log&&(identical(other.type, type) || other.type == type)&&(identical(other.path, path) || other.path == path)&&(identical(other.response, response) || other.response == response)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.bloc, bloc) || other.bloc == bloc)&&(identical(other.event, event) || other.event == event)&&(identical(other.exceptionType, exceptionType) || other.exceptionType == exceptionType)&&(identical(other.exceptionSource, exceptionSource) || other.exceptionSource == exceptionSource)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,path,response,statusCode,bloc,event,exceptionType,exceptionSource,stackTrace);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Log(type: $type, path: $path, response: $response, statusCode: $statusCode, bloc: $bloc, event: $event, exceptionType: $exceptionType, exceptionSource: $exceptionSource, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class _$LogCopyWith<$Res> implements $LogCopyWith<$Res> {
  factory _$LogCopyWith(_Log value, $Res Function(_Log) _then) = __$LogCopyWithImpl;
@override @useResult
$Res call({
 LogType type, String? path, String? response, String? statusCode, String? bloc, String? event, String? exceptionType, String? exceptionSource, String? stackTrace
});




}
/// @nodoc
class __$LogCopyWithImpl<$Res>
    implements _$LogCopyWith<$Res> {
  __$LogCopyWithImpl(this._self, this._then);

  final _Log _self;
  final $Res Function(_Log) _then;

/// Create a copy of Log
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? path = freezed,Object? response = freezed,Object? statusCode = freezed,Object? bloc = freezed,Object? event = freezed,Object? exceptionType = freezed,Object? exceptionSource = freezed,Object? stackTrace = freezed,}) {
  return _then(_Log(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as LogType,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String?,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as String?,bloc: freezed == bloc ? _self.bloc : bloc // ignore: cast_nullable_to_non_nullable
as String?,event: freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as String?,exceptionType: freezed == exceptionType ? _self.exceptionType : exceptionType // ignore: cast_nullable_to_non_nullable
as String?,exceptionSource: freezed == exceptionSource ? _self.exceptionSource : exceptionSource // ignore: cast_nullable_to_non_nullable
as String?,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
