// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'derivation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeriveWalletState implements DiagnosticableTreeMixin {

 DeriveWalletStep get currentStep; DerivationPurpose get purpose; int get index; String get rawPath; String get passPhrase; String get errPassphrase; String get label; String get walletLabelError; bool get savingWallet; String get errSavingWallet; bool get newWalletSaved;
/// Create a copy of DeriveWalletState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeriveWalletStateCopyWith<DeriveWalletState> get copyWith => _$DeriveWalletStateCopyWithImpl<DeriveWalletState>(this as DeriveWalletState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DeriveWalletState'))
    ..add(DiagnosticsProperty('currentStep', currentStep))..add(DiagnosticsProperty('purpose', purpose))..add(DiagnosticsProperty('index', index))..add(DiagnosticsProperty('rawPath', rawPath))..add(DiagnosticsProperty('passPhrase', passPhrase))..add(DiagnosticsProperty('errPassphrase', errPassphrase))..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('walletLabelError', walletLabelError))..add(DiagnosticsProperty('savingWallet', savingWallet))..add(DiagnosticsProperty('errSavingWallet', errSavingWallet))..add(DiagnosticsProperty('newWalletSaved', newWalletSaved));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeriveWalletState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.index, index) || other.index == index)&&(identical(other.rawPath, rawPath) || other.rawPath == rawPath)&&(identical(other.passPhrase, passPhrase) || other.passPhrase == passPhrase)&&(identical(other.errPassphrase, errPassphrase) || other.errPassphrase == errPassphrase)&&(identical(other.label, label) || other.label == label)&&(identical(other.walletLabelError, walletLabelError) || other.walletLabelError == walletLabelError)&&(identical(other.savingWallet, savingWallet) || other.savingWallet == savingWallet)&&(identical(other.errSavingWallet, errSavingWallet) || other.errSavingWallet == errSavingWallet)&&(identical(other.newWalletSaved, newWalletSaved) || other.newWalletSaved == newWalletSaved));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,purpose,index,rawPath,passPhrase,errPassphrase,label,walletLabelError,savingWallet,errSavingWallet,newWalletSaved);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DeriveWalletState(currentStep: $currentStep, purpose: $purpose, index: $index, rawPath: $rawPath, passPhrase: $passPhrase, errPassphrase: $errPassphrase, label: $label, walletLabelError: $walletLabelError, savingWallet: $savingWallet, errSavingWallet: $errSavingWallet, newWalletSaved: $newWalletSaved)';
}


}

/// @nodoc
abstract mixin class $DeriveWalletStateCopyWith<$Res>  {
  factory $DeriveWalletStateCopyWith(DeriveWalletState value, $Res Function(DeriveWalletState) _then) = _$DeriveWalletStateCopyWithImpl;
@useResult
$Res call({
 DeriveWalletStep currentStep, DerivationPurpose purpose, int index, String rawPath, String passPhrase, String errPassphrase, String label, String walletLabelError, bool savingWallet, String errSavingWallet, bool newWalletSaved
});




}
/// @nodoc
class _$DeriveWalletStateCopyWithImpl<$Res>
    implements $DeriveWalletStateCopyWith<$Res> {
  _$DeriveWalletStateCopyWithImpl(this._self, this._then);

  final DeriveWalletState _self;
  final $Res Function(DeriveWalletState) _then;

/// Create a copy of DeriveWalletState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? purpose = null,Object? index = null,Object? rawPath = null,Object? passPhrase = null,Object? errPassphrase = null,Object? label = null,Object? walletLabelError = null,Object? savingWallet = null,Object? errSavingWallet = null,Object? newWalletSaved = null,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as DeriveWalletStep,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as DerivationPurpose,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,rawPath: null == rawPath ? _self.rawPath : rawPath // ignore: cast_nullable_to_non_nullable
as String,passPhrase: null == passPhrase ? _self.passPhrase : passPhrase // ignore: cast_nullable_to_non_nullable
as String,errPassphrase: null == errPassphrase ? _self.errPassphrase : errPassphrase // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,walletLabelError: null == walletLabelError ? _self.walletLabelError : walletLabelError // ignore: cast_nullable_to_non_nullable
as String,savingWallet: null == savingWallet ? _self.savingWallet : savingWallet // ignore: cast_nullable_to_non_nullable
as bool,errSavingWallet: null == errSavingWallet ? _self.errSavingWallet : errSavingWallet // ignore: cast_nullable_to_non_nullable
as String,newWalletSaved: null == newWalletSaved ? _self.newWalletSaved : newWalletSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DeriveWalletState].
extension DeriveWalletStatePatterns on DeriveWalletState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeriveWalletState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeriveWalletState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeriveWalletState value)  $default,){
final _that = this;
switch (_that) {
case _DeriveWalletState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeriveWalletState value)?  $default,){
final _that = this;
switch (_that) {
case _DeriveWalletState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DeriveWalletStep currentStep,  DerivationPurpose purpose,  int index,  String rawPath,  String passPhrase,  String errPassphrase,  String label,  String walletLabelError,  bool savingWallet,  String errSavingWallet,  bool newWalletSaved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeriveWalletState() when $default != null:
return $default(_that.currentStep,_that.purpose,_that.index,_that.rawPath,_that.passPhrase,_that.errPassphrase,_that.label,_that.walletLabelError,_that.savingWallet,_that.errSavingWallet,_that.newWalletSaved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DeriveWalletStep currentStep,  DerivationPurpose purpose,  int index,  String rawPath,  String passPhrase,  String errPassphrase,  String label,  String walletLabelError,  bool savingWallet,  String errSavingWallet,  bool newWalletSaved)  $default,) {final _that = this;
switch (_that) {
case _DeriveWalletState():
return $default(_that.currentStep,_that.purpose,_that.index,_that.rawPath,_that.passPhrase,_that.errPassphrase,_that.label,_that.walletLabelError,_that.savingWallet,_that.errSavingWallet,_that.newWalletSaved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DeriveWalletStep currentStep,  DerivationPurpose purpose,  int index,  String rawPath,  String passPhrase,  String errPassphrase,  String label,  String walletLabelError,  bool savingWallet,  String errSavingWallet,  bool newWalletSaved)?  $default,) {final _that = this;
switch (_that) {
case _DeriveWalletState() when $default != null:
return $default(_that.currentStep,_that.purpose,_that.index,_that.rawPath,_that.passPhrase,_that.errPassphrase,_that.label,_that.walletLabelError,_that.savingWallet,_that.errSavingWallet,_that.newWalletSaved);case _:
  return null;

}
}

}

/// @nodoc


class _DeriveWalletState with DiagnosticableTreeMixin implements DeriveWalletState {
  const _DeriveWalletState({this.currentStep = DeriveWalletStep.purpose, this.purpose = DerivationPurpose.segwit, this.index = 0, this.rawPath = 'm/0h/0h/0h', this.passPhrase = '', this.errPassphrase = '', this.label = '', this.walletLabelError = '', this.savingWallet = false, this.errSavingWallet = '', this.newWalletSaved = false});
  

@override@JsonKey() final  DeriveWalletStep currentStep;
@override@JsonKey() final  DerivationPurpose purpose;
@override@JsonKey() final  int index;
@override@JsonKey() final  String rawPath;
@override@JsonKey() final  String passPhrase;
@override@JsonKey() final  String errPassphrase;
@override@JsonKey() final  String label;
@override@JsonKey() final  String walletLabelError;
@override@JsonKey() final  bool savingWallet;
@override@JsonKey() final  String errSavingWallet;
@override@JsonKey() final  bool newWalletSaved;

/// Create a copy of DeriveWalletState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeriveWalletStateCopyWith<_DeriveWalletState> get copyWith => __$DeriveWalletStateCopyWithImpl<_DeriveWalletState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DeriveWalletState'))
    ..add(DiagnosticsProperty('currentStep', currentStep))..add(DiagnosticsProperty('purpose', purpose))..add(DiagnosticsProperty('index', index))..add(DiagnosticsProperty('rawPath', rawPath))..add(DiagnosticsProperty('passPhrase', passPhrase))..add(DiagnosticsProperty('errPassphrase', errPassphrase))..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('walletLabelError', walletLabelError))..add(DiagnosticsProperty('savingWallet', savingWallet))..add(DiagnosticsProperty('errSavingWallet', errSavingWallet))..add(DiagnosticsProperty('newWalletSaved', newWalletSaved));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeriveWalletState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.index, index) || other.index == index)&&(identical(other.rawPath, rawPath) || other.rawPath == rawPath)&&(identical(other.passPhrase, passPhrase) || other.passPhrase == passPhrase)&&(identical(other.errPassphrase, errPassphrase) || other.errPassphrase == errPassphrase)&&(identical(other.label, label) || other.label == label)&&(identical(other.walletLabelError, walletLabelError) || other.walletLabelError == walletLabelError)&&(identical(other.savingWallet, savingWallet) || other.savingWallet == savingWallet)&&(identical(other.errSavingWallet, errSavingWallet) || other.errSavingWallet == errSavingWallet)&&(identical(other.newWalletSaved, newWalletSaved) || other.newWalletSaved == newWalletSaved));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,purpose,index,rawPath,passPhrase,errPassphrase,label,walletLabelError,savingWallet,errSavingWallet,newWalletSaved);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DeriveWalletState(currentStep: $currentStep, purpose: $purpose, index: $index, rawPath: $rawPath, passPhrase: $passPhrase, errPassphrase: $errPassphrase, label: $label, walletLabelError: $walletLabelError, savingWallet: $savingWallet, errSavingWallet: $errSavingWallet, newWalletSaved: $newWalletSaved)';
}


}

/// @nodoc
abstract mixin class _$DeriveWalletStateCopyWith<$Res> implements $DeriveWalletStateCopyWith<$Res> {
  factory _$DeriveWalletStateCopyWith(_DeriveWalletState value, $Res Function(_DeriveWalletState) _then) = __$DeriveWalletStateCopyWithImpl;
@override @useResult
$Res call({
 DeriveWalletStep currentStep, DerivationPurpose purpose, int index, String rawPath, String passPhrase, String errPassphrase, String label, String walletLabelError, bool savingWallet, String errSavingWallet, bool newWalletSaved
});




}
/// @nodoc
class __$DeriveWalletStateCopyWithImpl<$Res>
    implements _$DeriveWalletStateCopyWith<$Res> {
  __$DeriveWalletStateCopyWithImpl(this._self, this._then);

  final _DeriveWalletState _self;
  final $Res Function(_DeriveWalletState) _then;

/// Create a copy of DeriveWalletState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? purpose = null,Object? index = null,Object? rawPath = null,Object? passPhrase = null,Object? errPassphrase = null,Object? label = null,Object? walletLabelError = null,Object? savingWallet = null,Object? errSavingWallet = null,Object? newWalletSaved = null,}) {
  return _then(_DeriveWalletState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as DeriveWalletStep,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as DerivationPurpose,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,rawPath: null == rawPath ? _self.rawPath : rawPath // ignore: cast_nullable_to_non_nullable
as String,passPhrase: null == passPhrase ? _self.passPhrase : passPhrase // ignore: cast_nullable_to_non_nullable
as String,errPassphrase: null == errPassphrase ? _self.errPassphrase : errPassphrase // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,walletLabelError: null == walletLabelError ? _self.walletLabelError : walletLabelError // ignore: cast_nullable_to_non_nullable
as String,savingWallet: null == savingWallet ? _self.savingWallet : savingWallet // ignore: cast_nullable_to_non_nullable
as bool,errSavingWallet: null == errSavingWallet ? _self.errSavingWallet : errSavingWallet // ignore: cast_nullable_to_non_nullable
as String,newWalletSaved: null == newWalletSaved ? _self.newWalletSaved : newWalletSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
