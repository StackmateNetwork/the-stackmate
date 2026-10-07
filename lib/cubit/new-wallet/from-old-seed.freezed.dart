// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'from-old-seed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SeedImportWalletState implements DiagnosticableTreeMixin {

 SeedImportWalletSteps get currentStep; String get walletLabel; String get walletLabelError; bool get savingWallet; String get savingWalletError; bool get newWalletSaved; bool get labelFixed;
/// Create a copy of SeedImportWalletState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeedImportWalletStateCopyWith<SeedImportWalletState> get copyWith => _$SeedImportWalletStateCopyWithImpl<SeedImportWalletState>(this as SeedImportWalletState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SeedImportWalletState'))
    ..add(DiagnosticsProperty('currentStep', currentStep))..add(DiagnosticsProperty('walletLabel', walletLabel))..add(DiagnosticsProperty('walletLabelError', walletLabelError))..add(DiagnosticsProperty('savingWallet', savingWallet))..add(DiagnosticsProperty('savingWalletError', savingWalletError))..add(DiagnosticsProperty('newWalletSaved', newWalletSaved))..add(DiagnosticsProperty('labelFixed', labelFixed));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeedImportWalletState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.walletLabel, walletLabel) || other.walletLabel == walletLabel)&&(identical(other.walletLabelError, walletLabelError) || other.walletLabelError == walletLabelError)&&(identical(other.savingWallet, savingWallet) || other.savingWallet == savingWallet)&&(identical(other.savingWalletError, savingWalletError) || other.savingWalletError == savingWalletError)&&(identical(other.newWalletSaved, newWalletSaved) || other.newWalletSaved == newWalletSaved)&&(identical(other.labelFixed, labelFixed) || other.labelFixed == labelFixed));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,walletLabel,walletLabelError,savingWallet,savingWalletError,newWalletSaved,labelFixed);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SeedImportWalletState(currentStep: $currentStep, walletLabel: $walletLabel, walletLabelError: $walletLabelError, savingWallet: $savingWallet, savingWalletError: $savingWalletError, newWalletSaved: $newWalletSaved, labelFixed: $labelFixed)';
}


}

/// @nodoc
abstract mixin class $SeedImportWalletStateCopyWith<$Res>  {
  factory $SeedImportWalletStateCopyWith(SeedImportWalletState value, $Res Function(SeedImportWalletState) _then) = _$SeedImportWalletStateCopyWithImpl;
@useResult
$Res call({
 SeedImportWalletSteps currentStep, String walletLabel, String walletLabelError, bool savingWallet, String savingWalletError, bool newWalletSaved, bool labelFixed
});




}
/// @nodoc
class _$SeedImportWalletStateCopyWithImpl<$Res>
    implements $SeedImportWalletStateCopyWith<$Res> {
  _$SeedImportWalletStateCopyWithImpl(this._self, this._then);

  final SeedImportWalletState _self;
  final $Res Function(SeedImportWalletState) _then;

/// Create a copy of SeedImportWalletState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? walletLabel = null,Object? walletLabelError = null,Object? savingWallet = null,Object? savingWalletError = null,Object? newWalletSaved = null,Object? labelFixed = null,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as SeedImportWalletSteps,walletLabel: null == walletLabel ? _self.walletLabel : walletLabel // ignore: cast_nullable_to_non_nullable
as String,walletLabelError: null == walletLabelError ? _self.walletLabelError : walletLabelError // ignore: cast_nullable_to_non_nullable
as String,savingWallet: null == savingWallet ? _self.savingWallet : savingWallet // ignore: cast_nullable_to_non_nullable
as bool,savingWalletError: null == savingWalletError ? _self.savingWalletError : savingWalletError // ignore: cast_nullable_to_non_nullable
as String,newWalletSaved: null == newWalletSaved ? _self.newWalletSaved : newWalletSaved // ignore: cast_nullable_to_non_nullable
as bool,labelFixed: null == labelFixed ? _self.labelFixed : labelFixed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SeedImportWalletState].
extension SeedImportWalletStatePatterns on SeedImportWalletState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeedImportWalletState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeedImportWalletState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeedImportWalletState value)  $default,){
final _that = this;
switch (_that) {
case _SeedImportWalletState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeedImportWalletState value)?  $default,){
final _that = this;
switch (_that) {
case _SeedImportWalletState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SeedImportWalletSteps currentStep,  String walletLabel,  String walletLabelError,  bool savingWallet,  String savingWalletError,  bool newWalletSaved,  bool labelFixed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeedImportWalletState() when $default != null:
return $default(_that.currentStep,_that.walletLabel,_that.walletLabelError,_that.savingWallet,_that.savingWalletError,_that.newWalletSaved,_that.labelFixed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SeedImportWalletSteps currentStep,  String walletLabel,  String walletLabelError,  bool savingWallet,  String savingWalletError,  bool newWalletSaved,  bool labelFixed)  $default,) {final _that = this;
switch (_that) {
case _SeedImportWalletState():
return $default(_that.currentStep,_that.walletLabel,_that.walletLabelError,_that.savingWallet,_that.savingWalletError,_that.newWalletSaved,_that.labelFixed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SeedImportWalletSteps currentStep,  String walletLabel,  String walletLabelError,  bool savingWallet,  String savingWalletError,  bool newWalletSaved,  bool labelFixed)?  $default,) {final _that = this;
switch (_that) {
case _SeedImportWalletState() when $default != null:
return $default(_that.currentStep,_that.walletLabel,_that.walletLabelError,_that.savingWallet,_that.savingWalletError,_that.newWalletSaved,_that.labelFixed);case _:
  return null;

}
}

}

/// @nodoc


class _SeedImportWalletState extends SeedImportWalletState with DiagnosticableTreeMixin {
  const _SeedImportWalletState({this.currentStep = SeedImportWalletSteps.warning, this.walletLabel = '', this.walletLabelError = '', this.savingWallet = false, this.savingWalletError = '', this.newWalletSaved = false, this.labelFixed = false}): super._();
  

@override@JsonKey() final  SeedImportWalletSteps currentStep;
@override@JsonKey() final  String walletLabel;
@override@JsonKey() final  String walletLabelError;
@override@JsonKey() final  bool savingWallet;
@override@JsonKey() final  String savingWalletError;
@override@JsonKey() final  bool newWalletSaved;
@override@JsonKey() final  bool labelFixed;

/// Create a copy of SeedImportWalletState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeedImportWalletStateCopyWith<_SeedImportWalletState> get copyWith => __$SeedImportWalletStateCopyWithImpl<_SeedImportWalletState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SeedImportWalletState'))
    ..add(DiagnosticsProperty('currentStep', currentStep))..add(DiagnosticsProperty('walletLabel', walletLabel))..add(DiagnosticsProperty('walletLabelError', walletLabelError))..add(DiagnosticsProperty('savingWallet', savingWallet))..add(DiagnosticsProperty('savingWalletError', savingWalletError))..add(DiagnosticsProperty('newWalletSaved', newWalletSaved))..add(DiagnosticsProperty('labelFixed', labelFixed));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeedImportWalletState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.walletLabel, walletLabel) || other.walletLabel == walletLabel)&&(identical(other.walletLabelError, walletLabelError) || other.walletLabelError == walletLabelError)&&(identical(other.savingWallet, savingWallet) || other.savingWallet == savingWallet)&&(identical(other.savingWalletError, savingWalletError) || other.savingWalletError == savingWalletError)&&(identical(other.newWalletSaved, newWalletSaved) || other.newWalletSaved == newWalletSaved)&&(identical(other.labelFixed, labelFixed) || other.labelFixed == labelFixed));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,walletLabel,walletLabelError,savingWallet,savingWalletError,newWalletSaved,labelFixed);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SeedImportWalletState(currentStep: $currentStep, walletLabel: $walletLabel, walletLabelError: $walletLabelError, savingWallet: $savingWallet, savingWalletError: $savingWalletError, newWalletSaved: $newWalletSaved, labelFixed: $labelFixed)';
}


}

/// @nodoc
abstract mixin class _$SeedImportWalletStateCopyWith<$Res> implements $SeedImportWalletStateCopyWith<$Res> {
  factory _$SeedImportWalletStateCopyWith(_SeedImportWalletState value, $Res Function(_SeedImportWalletState) _then) = __$SeedImportWalletStateCopyWithImpl;
@override @useResult
$Res call({
 SeedImportWalletSteps currentStep, String walletLabel, String walletLabelError, bool savingWallet, String savingWalletError, bool newWalletSaved, bool labelFixed
});




}
/// @nodoc
class __$SeedImportWalletStateCopyWithImpl<$Res>
    implements _$SeedImportWalletStateCopyWith<$Res> {
  __$SeedImportWalletStateCopyWithImpl(this._self, this._then);

  final _SeedImportWalletState _self;
  final $Res Function(_SeedImportWalletState) _then;

/// Create a copy of SeedImportWalletState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? walletLabel = null,Object? walletLabelError = null,Object? savingWallet = null,Object? savingWalletError = null,Object? newWalletSaved = null,Object? labelFixed = null,}) {
  return _then(_SeedImportWalletState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as SeedImportWalletSteps,walletLabel: null == walletLabel ? _self.walletLabel : walletLabel // ignore: cast_nullable_to_non_nullable
as String,walletLabelError: null == walletLabelError ? _self.walletLabelError : walletLabelError // ignore: cast_nullable_to_non_nullable
as String,savingWallet: null == savingWallet ? _self.savingWallet : savingWallet // ignore: cast_nullable_to_non_nullable
as bool,savingWalletError: null == savingWalletError ? _self.savingWalletError : savingWalletError // ignore: cast_nullable_to_non_nullable
as String,newWalletSaved: null == newWalletSaved ? _self.newWalletSaved : newWalletSaved // ignore: cast_nullable_to_non_nullable
as bool,labelFixed: null == labelFixed ? _self.labelFixed : labelFixed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
