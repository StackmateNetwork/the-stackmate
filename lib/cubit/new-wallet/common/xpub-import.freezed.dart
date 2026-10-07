// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'xpub-import.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$XpubImportState {

 String get xpub; String get fingerPrint; String get path; String get errXpub; String get errFileImport; bool get cameraOpened; bool get detailsReady; bool get clearJson; String? get importedJSONPath; String? get importedJSONfileName;
/// Create a copy of XpubImportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XpubImportStateCopyWith<XpubImportState> get copyWith => _$XpubImportStateCopyWithImpl<XpubImportState>(this as XpubImportState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XpubImportState&&(identical(other.xpub, xpub) || other.xpub == xpub)&&(identical(other.fingerPrint, fingerPrint) || other.fingerPrint == fingerPrint)&&(identical(other.path, path) || other.path == path)&&(identical(other.errXpub, errXpub) || other.errXpub == errXpub)&&(identical(other.errFileImport, errFileImport) || other.errFileImport == errFileImport)&&(identical(other.cameraOpened, cameraOpened) || other.cameraOpened == cameraOpened)&&(identical(other.detailsReady, detailsReady) || other.detailsReady == detailsReady)&&(identical(other.clearJson, clearJson) || other.clearJson == clearJson)&&(identical(other.importedJSONPath, importedJSONPath) || other.importedJSONPath == importedJSONPath)&&(identical(other.importedJSONfileName, importedJSONfileName) || other.importedJSONfileName == importedJSONfileName));
}


@override
int get hashCode => Object.hash(runtimeType,xpub,fingerPrint,path,errXpub,errFileImport,cameraOpened,detailsReady,clearJson,importedJSONPath,importedJSONfileName);

@override
String toString() {
  return 'XpubImportState(xpub: $xpub, fingerPrint: $fingerPrint, path: $path, errXpub: $errXpub, errFileImport: $errFileImport, cameraOpened: $cameraOpened, detailsReady: $detailsReady, clearJson: $clearJson, importedJSONPath: $importedJSONPath, importedJSONfileName: $importedJSONfileName)';
}


}

/// @nodoc
abstract mixin class $XpubImportStateCopyWith<$Res>  {
  factory $XpubImportStateCopyWith(XpubImportState value, $Res Function(XpubImportState) _then) = _$XpubImportStateCopyWithImpl;
@useResult
$Res call({
 String xpub, String fingerPrint, String path, String errXpub, String errFileImport, bool cameraOpened, bool detailsReady, bool clearJson, String? importedJSONPath, String? importedJSONfileName
});




}
/// @nodoc
class _$XpubImportStateCopyWithImpl<$Res>
    implements $XpubImportStateCopyWith<$Res> {
  _$XpubImportStateCopyWithImpl(this._self, this._then);

  final XpubImportState _self;
  final $Res Function(XpubImportState) _then;

/// Create a copy of XpubImportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? xpub = null,Object? fingerPrint = null,Object? path = null,Object? errXpub = null,Object? errFileImport = null,Object? cameraOpened = null,Object? detailsReady = null,Object? clearJson = null,Object? importedJSONPath = freezed,Object? importedJSONfileName = freezed,}) {
  return _then(_self.copyWith(
xpub: null == xpub ? _self.xpub : xpub // ignore: cast_nullable_to_non_nullable
as String,fingerPrint: null == fingerPrint ? _self.fingerPrint : fingerPrint // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,errXpub: null == errXpub ? _self.errXpub : errXpub // ignore: cast_nullable_to_non_nullable
as String,errFileImport: null == errFileImport ? _self.errFileImport : errFileImport // ignore: cast_nullable_to_non_nullable
as String,cameraOpened: null == cameraOpened ? _self.cameraOpened : cameraOpened // ignore: cast_nullable_to_non_nullable
as bool,detailsReady: null == detailsReady ? _self.detailsReady : detailsReady // ignore: cast_nullable_to_non_nullable
as bool,clearJson: null == clearJson ? _self.clearJson : clearJson // ignore: cast_nullable_to_non_nullable
as bool,importedJSONPath: freezed == importedJSONPath ? _self.importedJSONPath : importedJSONPath // ignore: cast_nullable_to_non_nullable
as String?,importedJSONfileName: freezed == importedJSONfileName ? _self.importedJSONfileName : importedJSONfileName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [XpubImportState].
extension XpubImportStatePatterns on XpubImportState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeedImportXpubState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeedImportXpubState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeedImportXpubState value)  $default,){
final _that = this;
switch (_that) {
case _SeedImportXpubState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeedImportXpubState value)?  $default,){
final _that = this;
switch (_that) {
case _SeedImportXpubState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String xpub,  String fingerPrint,  String path,  String errXpub,  String errFileImport,  bool cameraOpened,  bool detailsReady,  bool clearJson,  String? importedJSONPath,  String? importedJSONfileName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeedImportXpubState() when $default != null:
return $default(_that.xpub,_that.fingerPrint,_that.path,_that.errXpub,_that.errFileImport,_that.cameraOpened,_that.detailsReady,_that.clearJson,_that.importedJSONPath,_that.importedJSONfileName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String xpub,  String fingerPrint,  String path,  String errXpub,  String errFileImport,  bool cameraOpened,  bool detailsReady,  bool clearJson,  String? importedJSONPath,  String? importedJSONfileName)  $default,) {final _that = this;
switch (_that) {
case _SeedImportXpubState():
return $default(_that.xpub,_that.fingerPrint,_that.path,_that.errXpub,_that.errFileImport,_that.cameraOpened,_that.detailsReady,_that.clearJson,_that.importedJSONPath,_that.importedJSONfileName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String xpub,  String fingerPrint,  String path,  String errXpub,  String errFileImport,  bool cameraOpened,  bool detailsReady,  bool clearJson,  String? importedJSONPath,  String? importedJSONfileName)?  $default,) {final _that = this;
switch (_that) {
case _SeedImportXpubState() when $default != null:
return $default(_that.xpub,_that.fingerPrint,_that.path,_that.errXpub,_that.errFileImport,_that.cameraOpened,_that.detailsReady,_that.clearJson,_that.importedJSONPath,_that.importedJSONfileName);case _:
  return null;

}
}

}

/// @nodoc


class _SeedImportXpubState extends XpubImportState {
  const _SeedImportXpubState({this.xpub = '', this.fingerPrint = '', this.path = '', this.errXpub = '', this.errFileImport = '', this.cameraOpened = false, this.detailsReady = false, this.clearJson = false, this.importedJSONPath, this.importedJSONfileName}): super._();
  

@override@JsonKey() final  String xpub;
@override@JsonKey() final  String fingerPrint;
@override@JsonKey() final  String path;
@override@JsonKey() final  String errXpub;
@override@JsonKey() final  String errFileImport;
@override@JsonKey() final  bool cameraOpened;
@override@JsonKey() final  bool detailsReady;
@override@JsonKey() final  bool clearJson;
@override final  String? importedJSONPath;
@override final  String? importedJSONfileName;

/// Create a copy of XpubImportState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeedImportXpubStateCopyWith<_SeedImportXpubState> get copyWith => __$SeedImportXpubStateCopyWithImpl<_SeedImportXpubState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeedImportXpubState&&(identical(other.xpub, xpub) || other.xpub == xpub)&&(identical(other.fingerPrint, fingerPrint) || other.fingerPrint == fingerPrint)&&(identical(other.path, path) || other.path == path)&&(identical(other.errXpub, errXpub) || other.errXpub == errXpub)&&(identical(other.errFileImport, errFileImport) || other.errFileImport == errFileImport)&&(identical(other.cameraOpened, cameraOpened) || other.cameraOpened == cameraOpened)&&(identical(other.detailsReady, detailsReady) || other.detailsReady == detailsReady)&&(identical(other.clearJson, clearJson) || other.clearJson == clearJson)&&(identical(other.importedJSONPath, importedJSONPath) || other.importedJSONPath == importedJSONPath)&&(identical(other.importedJSONfileName, importedJSONfileName) || other.importedJSONfileName == importedJSONfileName));
}


@override
int get hashCode => Object.hash(runtimeType,xpub,fingerPrint,path,errXpub,errFileImport,cameraOpened,detailsReady,clearJson,importedJSONPath,importedJSONfileName);

@override
String toString() {
  return 'XpubImportState(xpub: $xpub, fingerPrint: $fingerPrint, path: $path, errXpub: $errXpub, errFileImport: $errFileImport, cameraOpened: $cameraOpened, detailsReady: $detailsReady, clearJson: $clearJson, importedJSONPath: $importedJSONPath, importedJSONfileName: $importedJSONfileName)';
}


}

/// @nodoc
abstract mixin class _$SeedImportXpubStateCopyWith<$Res> implements $XpubImportStateCopyWith<$Res> {
  factory _$SeedImportXpubStateCopyWith(_SeedImportXpubState value, $Res Function(_SeedImportXpubState) _then) = __$SeedImportXpubStateCopyWithImpl;
@override @useResult
$Res call({
 String xpub, String fingerPrint, String path, String errXpub, String errFileImport, bool cameraOpened, bool detailsReady, bool clearJson, String? importedJSONPath, String? importedJSONfileName
});




}
/// @nodoc
class __$SeedImportXpubStateCopyWithImpl<$Res>
    implements _$SeedImportXpubStateCopyWith<$Res> {
  __$SeedImportXpubStateCopyWithImpl(this._self, this._then);

  final _SeedImportXpubState _self;
  final $Res Function(_SeedImportXpubState) _then;

/// Create a copy of XpubImportState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? xpub = null,Object? fingerPrint = null,Object? path = null,Object? errXpub = null,Object? errFileImport = null,Object? cameraOpened = null,Object? detailsReady = null,Object? clearJson = null,Object? importedJSONPath = freezed,Object? importedJSONfileName = freezed,}) {
  return _then(_SeedImportXpubState(
xpub: null == xpub ? _self.xpub : xpub // ignore: cast_nullable_to_non_nullable
as String,fingerPrint: null == fingerPrint ? _self.fingerPrint : fingerPrint // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,errXpub: null == errXpub ? _self.errXpub : errXpub // ignore: cast_nullable_to_non_nullable
as String,errFileImport: null == errFileImport ? _self.errFileImport : errFileImport // ignore: cast_nullable_to_non_nullable
as String,cameraOpened: null == cameraOpened ? _self.cameraOpened : cameraOpened // ignore: cast_nullable_to_non_nullable
as bool,detailsReady: null == detailsReady ? _self.detailsReady : detailsReady // ignore: cast_nullable_to_non_nullable
as bool,clearJson: null == clearJson ? _self.clearJson : clearJson // ignore: cast_nullable_to_non_nullable
as bool,importedJSONPath: freezed == importedJSONPath ? _self.importedJSONPath : importedJSONPath // ignore: cast_nullable_to_non_nullable
as String?,importedJSONfileName: freezed == importedJSONfileName ? _self.importedJSONfileName : importedJSONfileName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
