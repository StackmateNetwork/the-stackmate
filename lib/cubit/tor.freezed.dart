// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TorState {

 String get workingDir; bool get enforced; bool get internal; int get socks5Port; String get httpProxy; String get bootstapProgress; bool get isRunning; bool get isEdittingExternal; bool get isConnected; String get controlKey; String get errConnection; String get errStorage; String get errMessage;
/// Create a copy of TorState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TorStateCopyWith<TorState> get copyWith => _$TorStateCopyWithImpl<TorState>(this as TorState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TorState&&(identical(other.workingDir, workingDir) || other.workingDir == workingDir)&&(identical(other.enforced, enforced) || other.enforced == enforced)&&(identical(other.internal, internal) || other.internal == internal)&&(identical(other.socks5Port, socks5Port) || other.socks5Port == socks5Port)&&(identical(other.httpProxy, httpProxy) || other.httpProxy == httpProxy)&&(identical(other.bootstapProgress, bootstapProgress) || other.bootstapProgress == bootstapProgress)&&(identical(other.isRunning, isRunning) || other.isRunning == isRunning)&&(identical(other.isEdittingExternal, isEdittingExternal) || other.isEdittingExternal == isEdittingExternal)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.controlKey, controlKey) || other.controlKey == controlKey)&&(identical(other.errConnection, errConnection) || other.errConnection == errConnection)&&(identical(other.errStorage, errStorage) || other.errStorage == errStorage)&&(identical(other.errMessage, errMessage) || other.errMessage == errMessage));
}


@override
int get hashCode => Object.hash(runtimeType,workingDir,enforced,internal,socks5Port,httpProxy,bootstapProgress,isRunning,isEdittingExternal,isConnected,controlKey,errConnection,errStorage,errMessage);

@override
String toString() {
  return 'TorState(workingDir: $workingDir, enforced: $enforced, internal: $internal, socks5Port: $socks5Port, httpProxy: $httpProxy, bootstapProgress: $bootstapProgress, isRunning: $isRunning, isEdittingExternal: $isEdittingExternal, isConnected: $isConnected, controlKey: $controlKey, errConnection: $errConnection, errStorage: $errStorage, errMessage: $errMessage)';
}


}

/// @nodoc
abstract mixin class $TorStateCopyWith<$Res>  {
  factory $TorStateCopyWith(TorState value, $Res Function(TorState) _then) = _$TorStateCopyWithImpl;
@useResult
$Res call({
 String workingDir, bool enforced, bool internal, int socks5Port, String httpProxy, String bootstapProgress, bool isRunning, bool isEdittingExternal, bool isConnected, String controlKey, String errConnection, String errStorage, String errMessage
});




}
/// @nodoc
class _$TorStateCopyWithImpl<$Res>
    implements $TorStateCopyWith<$Res> {
  _$TorStateCopyWithImpl(this._self, this._then);

  final TorState _self;
  final $Res Function(TorState) _then;

/// Create a copy of TorState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workingDir = null,Object? enforced = null,Object? internal = null,Object? socks5Port = null,Object? httpProxy = null,Object? bootstapProgress = null,Object? isRunning = null,Object? isEdittingExternal = null,Object? isConnected = null,Object? controlKey = null,Object? errConnection = null,Object? errStorage = null,Object? errMessage = null,}) {
  return _then(_self.copyWith(
workingDir: null == workingDir ? _self.workingDir : workingDir // ignore: cast_nullable_to_non_nullable
as String,enforced: null == enforced ? _self.enforced : enforced // ignore: cast_nullable_to_non_nullable
as bool,internal: null == internal ? _self.internal : internal // ignore: cast_nullable_to_non_nullable
as bool,socks5Port: null == socks5Port ? _self.socks5Port : socks5Port // ignore: cast_nullable_to_non_nullable
as int,httpProxy: null == httpProxy ? _self.httpProxy : httpProxy // ignore: cast_nullable_to_non_nullable
as String,bootstapProgress: null == bootstapProgress ? _self.bootstapProgress : bootstapProgress // ignore: cast_nullable_to_non_nullable
as String,isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,isEdittingExternal: null == isEdittingExternal ? _self.isEdittingExternal : isEdittingExternal // ignore: cast_nullable_to_non_nullable
as bool,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,controlKey: null == controlKey ? _self.controlKey : controlKey // ignore: cast_nullable_to_non_nullable
as String,errConnection: null == errConnection ? _self.errConnection : errConnection // ignore: cast_nullable_to_non_nullable
as String,errStorage: null == errStorage ? _self.errStorage : errStorage // ignore: cast_nullable_to_non_nullable
as String,errMessage: null == errMessage ? _self.errMessage : errMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TorState].
extension TorStatePatterns on TorState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TorState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TorState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TorState value)  $default,){
final _that = this;
switch (_that) {
case _TorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TorState value)?  $default,){
final _that = this;
switch (_that) {
case _TorState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String workingDir,  bool enforced,  bool internal,  int socks5Port,  String httpProxy,  String bootstapProgress,  bool isRunning,  bool isEdittingExternal,  bool isConnected,  String controlKey,  String errConnection,  String errStorage,  String errMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TorState() when $default != null:
return $default(_that.workingDir,_that.enforced,_that.internal,_that.socks5Port,_that.httpProxy,_that.bootstapProgress,_that.isRunning,_that.isEdittingExternal,_that.isConnected,_that.controlKey,_that.errConnection,_that.errStorage,_that.errMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String workingDir,  bool enforced,  bool internal,  int socks5Port,  String httpProxy,  String bootstapProgress,  bool isRunning,  bool isEdittingExternal,  bool isConnected,  String controlKey,  String errConnection,  String errStorage,  String errMessage)  $default,) {final _that = this;
switch (_that) {
case _TorState():
return $default(_that.workingDir,_that.enforced,_that.internal,_that.socks5Port,_that.httpProxy,_that.bootstapProgress,_that.isRunning,_that.isEdittingExternal,_that.isConnected,_that.controlKey,_that.errConnection,_that.errStorage,_that.errMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String workingDir,  bool enforced,  bool internal,  int socks5Port,  String httpProxy,  String bootstapProgress,  bool isRunning,  bool isEdittingExternal,  bool isConnected,  String controlKey,  String errConnection,  String errStorage,  String errMessage)?  $default,) {final _that = this;
switch (_that) {
case _TorState() when $default != null:
return $default(_that.workingDir,_that.enforced,_that.internal,_that.socks5Port,_that.httpProxy,_that.bootstapProgress,_that.isRunning,_that.isEdittingExternal,_that.isConnected,_that.controlKey,_that.errConnection,_that.errStorage,_that.errMessage);case _:
  return null;

}
}

}

/// @nodoc


class _TorState extends TorState {
  const _TorState({this.workingDir = '/tmp', this.enforced = true, this.internal = true, this.socks5Port = 9050, this.httpProxy = '', this.bootstapProgress = 'Starting Tor.\nThis may take a while ...', this.isRunning = false, this.isEdittingExternal = false, this.isConnected = false, this.controlKey = '', this.errConnection = '', this.errStorage = '', this.errMessage = ''}): super._();
  

@override@JsonKey() final  String workingDir;
@override@JsonKey() final  bool enforced;
@override@JsonKey() final  bool internal;
@override@JsonKey() final  int socks5Port;
@override@JsonKey() final  String httpProxy;
@override@JsonKey() final  String bootstapProgress;
@override@JsonKey() final  bool isRunning;
@override@JsonKey() final  bool isEdittingExternal;
@override@JsonKey() final  bool isConnected;
@override@JsonKey() final  String controlKey;
@override@JsonKey() final  String errConnection;
@override@JsonKey() final  String errStorage;
@override@JsonKey() final  String errMessage;

/// Create a copy of TorState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TorStateCopyWith<_TorState> get copyWith => __$TorStateCopyWithImpl<_TorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TorState&&(identical(other.workingDir, workingDir) || other.workingDir == workingDir)&&(identical(other.enforced, enforced) || other.enforced == enforced)&&(identical(other.internal, internal) || other.internal == internal)&&(identical(other.socks5Port, socks5Port) || other.socks5Port == socks5Port)&&(identical(other.httpProxy, httpProxy) || other.httpProxy == httpProxy)&&(identical(other.bootstapProgress, bootstapProgress) || other.bootstapProgress == bootstapProgress)&&(identical(other.isRunning, isRunning) || other.isRunning == isRunning)&&(identical(other.isEdittingExternal, isEdittingExternal) || other.isEdittingExternal == isEdittingExternal)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected)&&(identical(other.controlKey, controlKey) || other.controlKey == controlKey)&&(identical(other.errConnection, errConnection) || other.errConnection == errConnection)&&(identical(other.errStorage, errStorage) || other.errStorage == errStorage)&&(identical(other.errMessage, errMessage) || other.errMessage == errMessage));
}


@override
int get hashCode => Object.hash(runtimeType,workingDir,enforced,internal,socks5Port,httpProxy,bootstapProgress,isRunning,isEdittingExternal,isConnected,controlKey,errConnection,errStorage,errMessage);

@override
String toString() {
  return 'TorState(workingDir: $workingDir, enforced: $enforced, internal: $internal, socks5Port: $socks5Port, httpProxy: $httpProxy, bootstapProgress: $bootstapProgress, isRunning: $isRunning, isEdittingExternal: $isEdittingExternal, isConnected: $isConnected, controlKey: $controlKey, errConnection: $errConnection, errStorage: $errStorage, errMessage: $errMessage)';
}


}

/// @nodoc
abstract mixin class _$TorStateCopyWith<$Res> implements $TorStateCopyWith<$Res> {
  factory _$TorStateCopyWith(_TorState value, $Res Function(_TorState) _then) = __$TorStateCopyWithImpl;
@override @useResult
$Res call({
 String workingDir, bool enforced, bool internal, int socks5Port, String httpProxy, String bootstapProgress, bool isRunning, bool isEdittingExternal, bool isConnected, String controlKey, String errConnection, String errStorage, String errMessage
});




}
/// @nodoc
class __$TorStateCopyWithImpl<$Res>
    implements _$TorStateCopyWith<$Res> {
  __$TorStateCopyWithImpl(this._self, this._then);

  final _TorState _self;
  final $Res Function(_TorState) _then;

/// Create a copy of TorState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workingDir = null,Object? enforced = null,Object? internal = null,Object? socks5Port = null,Object? httpProxy = null,Object? bootstapProgress = null,Object? isRunning = null,Object? isEdittingExternal = null,Object? isConnected = null,Object? controlKey = null,Object? errConnection = null,Object? errStorage = null,Object? errMessage = null,}) {
  return _then(_TorState(
workingDir: null == workingDir ? _self.workingDir : workingDir // ignore: cast_nullable_to_non_nullable
as String,enforced: null == enforced ? _self.enforced : enforced // ignore: cast_nullable_to_non_nullable
as bool,internal: null == internal ? _self.internal : internal // ignore: cast_nullable_to_non_nullable
as bool,socks5Port: null == socks5Port ? _self.socks5Port : socks5Port // ignore: cast_nullable_to_non_nullable
as int,httpProxy: null == httpProxy ? _self.httpProxy : httpProxy // ignore: cast_nullable_to_non_nullable
as String,bootstapProgress: null == bootstapProgress ? _self.bootstapProgress : bootstapProgress // ignore: cast_nullable_to_non_nullable
as String,isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,isEdittingExternal: null == isEdittingExternal ? _self.isEdittingExternal : isEdittingExternal // ignore: cast_nullable_to_non_nullable
as bool,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,controlKey: null == controlKey ? _self.controlKey : controlKey // ignore: cast_nullable_to_non_nullable
as String,errConnection: null == errConnection ? _self.errConnection : errConnection // ignore: cast_nullable_to_non_nullable
as String,errStorage: null == errStorage ? _self.errStorage : errStorage // ignore: cast_nullable_to_non_nullable
as String,errMessage: null == errMessage ? _self.errMessage : errMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
