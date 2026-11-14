// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'from-new-seed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SeedGenerateWalletState implements DiagnosticableTreeMixin {

 SeedGenerateWalletSteps get currentStep; String get walletLabel; String get walletLabelError; bool get savingWallet; String get savingWalletError; bool get newWalletSaved;
/// Create a copy of SeedGenerateWalletState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeedGenerateWalletStateCopyWith<SeedGenerateWalletState> get copyWith => _$SeedGenerateWalletStateCopyWithImpl<SeedGenerateWalletState>(this as SeedGenerateWalletState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as SeedGenerateWalletState;
  properties
    ..add(DiagnosticsProperty('type', 'SeedGenerateWalletState'))
    ..add(DiagnosticsProperty('currentStep', _this.currentStep))..add(DiagnosticsProperty('walletLabel', _this.walletLabel))..add(DiagnosticsProperty('walletLabelError', _this.walletLabelError))..add(DiagnosticsProperty('savingWallet', _this.savingWallet))..add(DiagnosticsProperty('savingWalletError', _this.savingWalletError))..add(DiagnosticsProperty('newWalletSaved', _this.newWalletSaved));
}

@override
bool operator ==(Object other) {
  final _this = this as SeedGenerateWalletState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeedGenerateWalletState&&(identical(other.currentStep, _this.currentStep) || other.currentStep == _this.currentStep)&&(identical(other.walletLabel, _this.walletLabel) || other.walletLabel == _this.walletLabel)&&(identical(other.walletLabelError, _this.walletLabelError) || other.walletLabelError == _this.walletLabelError)&&(identical(other.savingWallet, _this.savingWallet) || other.savingWallet == _this.savingWallet)&&(identical(other.savingWalletError, _this.savingWalletError) || other.savingWalletError == _this.savingWalletError)&&(identical(other.newWalletSaved, _this.newWalletSaved) || other.newWalletSaved == _this.newWalletSaved));
}


@override
int get hashCode {
  final _this = this as SeedGenerateWalletState;
  return Object.hash(runtimeType,_this.currentStep,_this.walletLabel,_this.walletLabelError,_this.savingWallet,_this.savingWalletError,_this.newWalletSaved);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as SeedGenerateWalletState;
  return 'SeedGenerateWalletState(currentStep: ${_this.currentStep}, walletLabel: ${_this.walletLabel}, walletLabelError: ${_this.walletLabelError}, savingWallet: ${_this.savingWallet}, savingWalletError: ${_this.savingWalletError}, newWalletSaved: ${_this.newWalletSaved})';
}


}

/// @nodoc
abstract mixin class $SeedGenerateWalletStateCopyWith<$Res>  {
  factory $SeedGenerateWalletStateCopyWith(SeedGenerateWalletState value, $Res Function(SeedGenerateWalletState) _then) = _$SeedGenerateWalletStateCopyWithImpl;
@useResult
$Res call({
 SeedGenerateWalletSteps currentStep, String walletLabel, String walletLabelError, bool savingWallet, String savingWalletError, bool newWalletSaved
});




}
/// @nodoc
class _$SeedGenerateWalletStateCopyWithImpl<$Res>
    implements $SeedGenerateWalletStateCopyWith<$Res> {
  _$SeedGenerateWalletStateCopyWithImpl(this._self, this._then);

  final SeedGenerateWalletState _self;
  final $Res Function(SeedGenerateWalletState) _then;

/// Create a copy of SeedGenerateWalletState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? walletLabel = null,Object? walletLabelError = null,Object? savingWallet = null,Object? savingWalletError = null,Object? newWalletSaved = null,}) {
  return _then(SeedGenerateWalletState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as SeedGenerateWalletSteps,walletLabel: null == walletLabel ? _self.walletLabel : walletLabel // ignore: cast_nullable_to_non_nullable
as String,walletLabelError: null == walletLabelError ? _self.walletLabelError : walletLabelError // ignore: cast_nullable_to_non_nullable
as String,savingWallet: null == savingWallet ? _self.savingWallet : savingWallet // ignore: cast_nullable_to_non_nullable
as bool,savingWalletError: null == savingWalletError ? _self.savingWalletError : savingWalletError // ignore: cast_nullable_to_non_nullable
as String,newWalletSaved: null == newWalletSaved ? _self.newWalletSaved : newWalletSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SeedGenerateWalletState].
extension SeedGenerateWalletStatePatterns on SeedGenerateWalletState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeedGenerateWalletState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeedGenerateWalletState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeedGenerateWalletState value)  $default,){
final _that = this;
switch (_that) {
case _SeedGenerateWalletState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeedGenerateWalletState value)?  $default,){
final _that = this;
switch (_that) {
case _SeedGenerateWalletState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SeedGenerateWalletSteps currentStep,  String walletLabel,  String walletLabelError,  bool savingWallet,  String savingWalletError,  bool newWalletSaved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeedGenerateWalletState() when $default != null:
return $default(_that.currentStep,_that.walletLabel,_that.walletLabelError,_that.savingWallet,_that.savingWalletError,_that.newWalletSaved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SeedGenerateWalletSteps currentStep,  String walletLabel,  String walletLabelError,  bool savingWallet,  String savingWalletError,  bool newWalletSaved)  $default,) {final _that = this;
switch (_that) {
case _SeedGenerateWalletState():
return $default(_that.currentStep,_that.walletLabel,_that.walletLabelError,_that.savingWallet,_that.savingWalletError,_that.newWalletSaved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SeedGenerateWalletSteps currentStep,  String walletLabel,  String walletLabelError,  bool savingWallet,  String savingWalletError,  bool newWalletSaved)?  $default,) {final _that = this;
switch (_that) {
case _SeedGenerateWalletState() when $default != null:
return $default(_that.currentStep,_that.walletLabel,_that.walletLabelError,_that.savingWallet,_that.savingWalletError,_that.newWalletSaved);case _:
  return null;

}
}

}

/// @nodoc


class _SeedGenerateWalletState extends SeedGenerateWalletState with DiagnosticableTreeMixin {
  const _SeedGenerateWalletState({this.currentStep = SeedGenerateWalletSteps.warning, this.walletLabel = '', this.walletLabelError = '', this.savingWallet = false, this.savingWalletError = '', this.newWalletSaved = false}): super._();
  

@override@JsonKey() final  SeedGenerateWalletSteps currentStep;
@override@JsonKey() final  String walletLabel;
@override@JsonKey() final  String walletLabelError;
@override@JsonKey() final  bool savingWallet;
@override@JsonKey() final  String savingWalletError;
@override@JsonKey() final  bool newWalletSaved;

/// Create a copy of SeedGenerateWalletState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeedGenerateWalletStateCopyWith<_SeedGenerateWalletState> get copyWith => __$SeedGenerateWalletStateCopyWithImpl<_SeedGenerateWalletState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'SeedGenerateWalletState'))
    ..add(DiagnosticsProperty('currentStep', currentStep))..add(DiagnosticsProperty('walletLabel', walletLabel))..add(DiagnosticsProperty('walletLabelError', walletLabelError))..add(DiagnosticsProperty('savingWallet', savingWallet))..add(DiagnosticsProperty('savingWalletError', savingWalletError))..add(DiagnosticsProperty('newWalletSaved', newWalletSaved));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeedGenerateWalletState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.walletLabel, walletLabel) || other.walletLabel == walletLabel)&&(identical(other.walletLabelError, walletLabelError) || other.walletLabelError == walletLabelError)&&(identical(other.savingWallet, savingWallet) || other.savingWallet == savingWallet)&&(identical(other.savingWalletError, savingWalletError) || other.savingWalletError == savingWalletError)&&(identical(other.newWalletSaved, newWalletSaved) || other.newWalletSaved == newWalletSaved));
}


@override
int get hashCode {
    return Object.hash(runtimeType,currentStep,walletLabel,walletLabelError,savingWallet,savingWalletError,newWalletSaved);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'SeedGenerateWalletState(currentStep: $currentStep, walletLabel: $walletLabel, walletLabelError: $walletLabelError, savingWallet: $savingWallet, savingWalletError: $savingWalletError, newWalletSaved: $newWalletSaved)';
}


}

/// @nodoc
abstract mixin class _$SeedGenerateWalletStateCopyWith<$Res> implements $SeedGenerateWalletStateCopyWith<$Res> {
  factory _$SeedGenerateWalletStateCopyWith(_SeedGenerateWalletState value, $Res Function(_SeedGenerateWalletState) _then) = __$SeedGenerateWalletStateCopyWithImpl;
@override @useResult
$Res call({
 SeedGenerateWalletSteps currentStep, String walletLabel, String walletLabelError, bool savingWallet, String savingWalletError, bool newWalletSaved
});




}
/// @nodoc
class __$SeedGenerateWalletStateCopyWithImpl<$Res>
    implements _$SeedGenerateWalletStateCopyWith<$Res> {
  __$SeedGenerateWalletStateCopyWithImpl(this._self, this._then);

  final _SeedGenerateWalletState _self;
  final $Res Function(_SeedGenerateWalletState) _then;

/// Create a copy of SeedGenerateWalletState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? walletLabel = null,Object? walletLabelError = null,Object? savingWallet = null,Object? savingWalletError = null,Object? newWalletSaved = null,}) {
  return _then(_SeedGenerateWalletState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as SeedGenerateWalletSteps,walletLabel: null == walletLabel ? _self.walletLabel : walletLabel // ignore: cast_nullable_to_non_nullable
as String,walletLabelError: null == walletLabelError ? _self.walletLabelError : walletLabelError // ignore: cast_nullable_to_non_nullable
as String,savingWallet: null == savingWallet ? _self.savingWallet : savingWallet // ignore: cast_nullable_to_non_nullable
as bool,savingWalletError: null == savingWalletError ? _self.savingWalletError : savingWalletError // ignore: cast_nullable_to_non_nullable
as String,newWalletSaved: null == newWalletSaved ? _self.newWalletSaved : newWalletSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
