// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logger.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoggerState implements DiagnosticableTreeMixin {

 List<Log> get logs;
/// Create a copy of LoggerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoggerStateCopyWith<LoggerState> get copyWith => _$LoggerStateCopyWithImpl<LoggerState>(this as LoggerState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoggerState'))
    ..add(DiagnosticsProperty('logs', logs));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoggerState&&const DeepCollectionEquality().equals(other.logs, logs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(logs));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoggerState(logs: $logs)';
}


}

/// @nodoc
abstract mixin class $LoggerStateCopyWith<$Res>  {
  factory $LoggerStateCopyWith(LoggerState value, $Res Function(LoggerState) _then) = _$LoggerStateCopyWithImpl;
@useResult
$Res call({
 List<Log> logs
});




}
/// @nodoc
class _$LoggerStateCopyWithImpl<$Res>
    implements $LoggerStateCopyWith<$Res> {
  _$LoggerStateCopyWithImpl(this._self, this._then);

  final LoggerState _self;
  final $Res Function(LoggerState) _then;

/// Create a copy of LoggerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? logs = null,}) {
  return _then(_self.copyWith(
logs: null == logs ? _self.logs : logs // ignore: cast_nullable_to_non_nullable
as List<Log>,
  ));
}

}


/// Adds pattern-matching-related methods to [LoggerState].
extension LoggerStatePatterns on LoggerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoggerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoggerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoggerState value)  $default,){
final _that = this;
switch (_that) {
case _LoggerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoggerState value)?  $default,){
final _that = this;
switch (_that) {
case _LoggerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Log> logs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoggerState() when $default != null:
return $default(_that.logs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Log> logs)  $default,) {final _that = this;
switch (_that) {
case _LoggerState():
return $default(_that.logs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Log> logs)?  $default,) {final _that = this;
switch (_that) {
case _LoggerState() when $default != null:
return $default(_that.logs);case _:
  return null;

}
}

}

/// @nodoc


class _LoggerState with DiagnosticableTreeMixin implements LoggerState {
  const _LoggerState({final  List<Log> logs = const []}): _logs = logs;
  

 final  List<Log> _logs;
@override@JsonKey() List<Log> get logs {
  if (_logs is EqualUnmodifiableListView) return _logs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logs);
}


/// Create a copy of LoggerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoggerStateCopyWith<_LoggerState> get copyWith => __$LoggerStateCopyWithImpl<_LoggerState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoggerState'))
    ..add(DiagnosticsProperty('logs', logs));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoggerState&&const DeepCollectionEquality().equals(other._logs, _logs));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_logs));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoggerState(logs: $logs)';
}


}

/// @nodoc
abstract mixin class _$LoggerStateCopyWith<$Res> implements $LoggerStateCopyWith<$Res> {
  factory _$LoggerStateCopyWith(_LoggerState value, $Res Function(_LoggerState) _then) = __$LoggerStateCopyWithImpl;
@override @useResult
$Res call({
 List<Log> logs
});




}
/// @nodoc
class __$LoggerStateCopyWithImpl<$Res>
    implements _$LoggerStateCopyWith<$Res> {
  __$LoggerStateCopyWithImpl(this._self, this._then);

  final _LoggerState _self;
  final $Res Function(_LoggerState) _then;

/// Create a copy of LoggerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? logs = null,}) {
  return _then(_LoggerState(
logs: null == logs ? _self._logs : logs // ignore: cast_nullable_to_non_nullable
as List<Log>,
  ));
}


}

// dart format on
