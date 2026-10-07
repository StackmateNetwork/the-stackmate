// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'broadcast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BroadcastState implements DiagnosticableTreeMixin {

 bool get broadcasting; String get errBroadcasting; String get psbt; String get hex; String get txId; String get errFileImport; bool get clearData; String? get importedPsbtPath; String? get importedPsbtfileName; String? get importedHexPath; String? get importedHexfileName;
/// Create a copy of BroadcastState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BroadcastStateCopyWith<BroadcastState> get copyWith => _$BroadcastStateCopyWithImpl<BroadcastState>(this as BroadcastState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BroadcastState'))
    ..add(DiagnosticsProperty('broadcasting', broadcasting))..add(DiagnosticsProperty('errBroadcasting', errBroadcasting))..add(DiagnosticsProperty('psbt', psbt))..add(DiagnosticsProperty('hex', hex))..add(DiagnosticsProperty('txId', txId))..add(DiagnosticsProperty('errFileImport', errFileImport))..add(DiagnosticsProperty('clearData', clearData))..add(DiagnosticsProperty('importedPsbtPath', importedPsbtPath))..add(DiagnosticsProperty('importedPsbtfileName', importedPsbtfileName))..add(DiagnosticsProperty('importedHexPath', importedHexPath))..add(DiagnosticsProperty('importedHexfileName', importedHexfileName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadcastState&&(identical(other.broadcasting, broadcasting) || other.broadcasting == broadcasting)&&(identical(other.errBroadcasting, errBroadcasting) || other.errBroadcasting == errBroadcasting)&&(identical(other.psbt, psbt) || other.psbt == psbt)&&(identical(other.hex, hex) || other.hex == hex)&&(identical(other.txId, txId) || other.txId == txId)&&(identical(other.errFileImport, errFileImport) || other.errFileImport == errFileImport)&&(identical(other.clearData, clearData) || other.clearData == clearData)&&(identical(other.importedPsbtPath, importedPsbtPath) || other.importedPsbtPath == importedPsbtPath)&&(identical(other.importedPsbtfileName, importedPsbtfileName) || other.importedPsbtfileName == importedPsbtfileName)&&(identical(other.importedHexPath, importedHexPath) || other.importedHexPath == importedHexPath)&&(identical(other.importedHexfileName, importedHexfileName) || other.importedHexfileName == importedHexfileName));
}


@override
int get hashCode => Object.hash(runtimeType,broadcasting,errBroadcasting,psbt,hex,txId,errFileImport,clearData,importedPsbtPath,importedPsbtfileName,importedHexPath,importedHexfileName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BroadcastState(broadcasting: $broadcasting, errBroadcasting: $errBroadcasting, psbt: $psbt, hex: $hex, txId: $txId, errFileImport: $errFileImport, clearData: $clearData, importedPsbtPath: $importedPsbtPath, importedPsbtfileName: $importedPsbtfileName, importedHexPath: $importedHexPath, importedHexfileName: $importedHexfileName)';
}


}

/// @nodoc
abstract mixin class $BroadcastStateCopyWith<$Res>  {
  factory $BroadcastStateCopyWith(BroadcastState value, $Res Function(BroadcastState) _then) = _$BroadcastStateCopyWithImpl;
@useResult
$Res call({
 bool broadcasting, String errBroadcasting, String psbt, String hex, String txId, String errFileImport, bool clearData, String? importedPsbtPath, String? importedPsbtfileName, String? importedHexPath, String? importedHexfileName
});




}
/// @nodoc
class _$BroadcastStateCopyWithImpl<$Res>
    implements $BroadcastStateCopyWith<$Res> {
  _$BroadcastStateCopyWithImpl(this._self, this._then);

  final BroadcastState _self;
  final $Res Function(BroadcastState) _then;

/// Create a copy of BroadcastState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? broadcasting = null,Object? errBroadcasting = null,Object? psbt = null,Object? hex = null,Object? txId = null,Object? errFileImport = null,Object? clearData = null,Object? importedPsbtPath = freezed,Object? importedPsbtfileName = freezed,Object? importedHexPath = freezed,Object? importedHexfileName = freezed,}) {
  return _then(_self.copyWith(
broadcasting: null == broadcasting ? _self.broadcasting : broadcasting // ignore: cast_nullable_to_non_nullable
as bool,errBroadcasting: null == errBroadcasting ? _self.errBroadcasting : errBroadcasting // ignore: cast_nullable_to_non_nullable
as String,psbt: null == psbt ? _self.psbt : psbt // ignore: cast_nullable_to_non_nullable
as String,hex: null == hex ? _self.hex : hex // ignore: cast_nullable_to_non_nullable
as String,txId: null == txId ? _self.txId : txId // ignore: cast_nullable_to_non_nullable
as String,errFileImport: null == errFileImport ? _self.errFileImport : errFileImport // ignore: cast_nullable_to_non_nullable
as String,clearData: null == clearData ? _self.clearData : clearData // ignore: cast_nullable_to_non_nullable
as bool,importedPsbtPath: freezed == importedPsbtPath ? _self.importedPsbtPath : importedPsbtPath // ignore: cast_nullable_to_non_nullable
as String?,importedPsbtfileName: freezed == importedPsbtfileName ? _self.importedPsbtfileName : importedPsbtfileName // ignore: cast_nullable_to_non_nullable
as String?,importedHexPath: freezed == importedHexPath ? _self.importedHexPath : importedHexPath // ignore: cast_nullable_to_non_nullable
as String?,importedHexfileName: freezed == importedHexfileName ? _self.importedHexfileName : importedHexfileName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BroadcastState].
extension BroadcastStatePatterns on BroadcastState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BroadcastState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BroadcastState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BroadcastState value)  $default,){
final _that = this;
switch (_that) {
case _BroadcastState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BroadcastState value)?  $default,){
final _that = this;
switch (_that) {
case _BroadcastState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool broadcasting,  String errBroadcasting,  String psbt,  String hex,  String txId,  String errFileImport,  bool clearData,  String? importedPsbtPath,  String? importedPsbtfileName,  String? importedHexPath,  String? importedHexfileName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BroadcastState() when $default != null:
return $default(_that.broadcasting,_that.errBroadcasting,_that.psbt,_that.hex,_that.txId,_that.errFileImport,_that.clearData,_that.importedPsbtPath,_that.importedPsbtfileName,_that.importedHexPath,_that.importedHexfileName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool broadcasting,  String errBroadcasting,  String psbt,  String hex,  String txId,  String errFileImport,  bool clearData,  String? importedPsbtPath,  String? importedPsbtfileName,  String? importedHexPath,  String? importedHexfileName)  $default,) {final _that = this;
switch (_that) {
case _BroadcastState():
return $default(_that.broadcasting,_that.errBroadcasting,_that.psbt,_that.hex,_that.txId,_that.errFileImport,_that.clearData,_that.importedPsbtPath,_that.importedPsbtfileName,_that.importedHexPath,_that.importedHexfileName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool broadcasting,  String errBroadcasting,  String psbt,  String hex,  String txId,  String errFileImport,  bool clearData,  String? importedPsbtPath,  String? importedPsbtfileName,  String? importedHexPath,  String? importedHexfileName)?  $default,) {final _that = this;
switch (_that) {
case _BroadcastState() when $default != null:
return $default(_that.broadcasting,_that.errBroadcasting,_that.psbt,_that.hex,_that.txId,_that.errFileImport,_that.clearData,_that.importedPsbtPath,_that.importedPsbtfileName,_that.importedHexPath,_that.importedHexfileName);case _:
  return null;

}
}

}

/// @nodoc


class _BroadcastState extends BroadcastState with DiagnosticableTreeMixin {
  const _BroadcastState({this.broadcasting = false, this.errBroadcasting = '', this.psbt = '', this.hex = '', this.txId = '', this.errFileImport = '', this.clearData = false, this.importedPsbtPath, this.importedPsbtfileName, this.importedHexPath, this.importedHexfileName}): super._();
  

@override@JsonKey() final  bool broadcasting;
@override@JsonKey() final  String errBroadcasting;
@override@JsonKey() final  String psbt;
@override@JsonKey() final  String hex;
@override@JsonKey() final  String txId;
@override@JsonKey() final  String errFileImport;
@override@JsonKey() final  bool clearData;
@override final  String? importedPsbtPath;
@override final  String? importedPsbtfileName;
@override final  String? importedHexPath;
@override final  String? importedHexfileName;

/// Create a copy of BroadcastState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BroadcastStateCopyWith<_BroadcastState> get copyWith => __$BroadcastStateCopyWithImpl<_BroadcastState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BroadcastState'))
    ..add(DiagnosticsProperty('broadcasting', broadcasting))..add(DiagnosticsProperty('errBroadcasting', errBroadcasting))..add(DiagnosticsProperty('psbt', psbt))..add(DiagnosticsProperty('hex', hex))..add(DiagnosticsProperty('txId', txId))..add(DiagnosticsProperty('errFileImport', errFileImport))..add(DiagnosticsProperty('clearData', clearData))..add(DiagnosticsProperty('importedPsbtPath', importedPsbtPath))..add(DiagnosticsProperty('importedPsbtfileName', importedPsbtfileName))..add(DiagnosticsProperty('importedHexPath', importedHexPath))..add(DiagnosticsProperty('importedHexfileName', importedHexfileName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BroadcastState&&(identical(other.broadcasting, broadcasting) || other.broadcasting == broadcasting)&&(identical(other.errBroadcasting, errBroadcasting) || other.errBroadcasting == errBroadcasting)&&(identical(other.psbt, psbt) || other.psbt == psbt)&&(identical(other.hex, hex) || other.hex == hex)&&(identical(other.txId, txId) || other.txId == txId)&&(identical(other.errFileImport, errFileImport) || other.errFileImport == errFileImport)&&(identical(other.clearData, clearData) || other.clearData == clearData)&&(identical(other.importedPsbtPath, importedPsbtPath) || other.importedPsbtPath == importedPsbtPath)&&(identical(other.importedPsbtfileName, importedPsbtfileName) || other.importedPsbtfileName == importedPsbtfileName)&&(identical(other.importedHexPath, importedHexPath) || other.importedHexPath == importedHexPath)&&(identical(other.importedHexfileName, importedHexfileName) || other.importedHexfileName == importedHexfileName));
}


@override
int get hashCode => Object.hash(runtimeType,broadcasting,errBroadcasting,psbt,hex,txId,errFileImport,clearData,importedPsbtPath,importedPsbtfileName,importedHexPath,importedHexfileName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BroadcastState(broadcasting: $broadcasting, errBroadcasting: $errBroadcasting, psbt: $psbt, hex: $hex, txId: $txId, errFileImport: $errFileImport, clearData: $clearData, importedPsbtPath: $importedPsbtPath, importedPsbtfileName: $importedPsbtfileName, importedHexPath: $importedHexPath, importedHexfileName: $importedHexfileName)';
}


}

/// @nodoc
abstract mixin class _$BroadcastStateCopyWith<$Res> implements $BroadcastStateCopyWith<$Res> {
  factory _$BroadcastStateCopyWith(_BroadcastState value, $Res Function(_BroadcastState) _then) = __$BroadcastStateCopyWithImpl;
@override @useResult
$Res call({
 bool broadcasting, String errBroadcasting, String psbt, String hex, String txId, String errFileImport, bool clearData, String? importedPsbtPath, String? importedPsbtfileName, String? importedHexPath, String? importedHexfileName
});




}
/// @nodoc
class __$BroadcastStateCopyWithImpl<$Res>
    implements _$BroadcastStateCopyWith<$Res> {
  __$BroadcastStateCopyWithImpl(this._self, this._then);

  final _BroadcastState _self;
  final $Res Function(_BroadcastState) _then;

/// Create a copy of BroadcastState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? broadcasting = null,Object? errBroadcasting = null,Object? psbt = null,Object? hex = null,Object? txId = null,Object? errFileImport = null,Object? clearData = null,Object? importedPsbtPath = freezed,Object? importedPsbtfileName = freezed,Object? importedHexPath = freezed,Object? importedHexfileName = freezed,}) {
  return _then(_BroadcastState(
broadcasting: null == broadcasting ? _self.broadcasting : broadcasting // ignore: cast_nullable_to_non_nullable
as bool,errBroadcasting: null == errBroadcasting ? _self.errBroadcasting : errBroadcasting // ignore: cast_nullable_to_non_nullable
as String,psbt: null == psbt ? _self.psbt : psbt // ignore: cast_nullable_to_non_nullable
as String,hex: null == hex ? _self.hex : hex // ignore: cast_nullable_to_non_nullable
as String,txId: null == txId ? _self.txId : txId // ignore: cast_nullable_to_non_nullable
as String,errFileImport: null == errFileImport ? _self.errFileImport : errFileImport // ignore: cast_nullable_to_non_nullable
as String,clearData: null == clearData ? _self.clearData : clearData // ignore: cast_nullable_to_non_nullable
as bool,importedPsbtPath: freezed == importedPsbtPath ? _self.importedPsbtPath : importedPsbtPath // ignore: cast_nullable_to_non_nullable
as String?,importedPsbtfileName: freezed == importedPsbtfileName ? _self.importedPsbtfileName : importedPsbtfileName // ignore: cast_nullable_to_non_nullable
as String?,importedHexPath: freezed == importedHexPath ? _self.importedHexPath : importedHexPath // ignore: cast_nullable_to_non_nullable
as String?,importedHexfileName: freezed == importedHexfileName ? _self.importedHexfileName : importedHexfileName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
