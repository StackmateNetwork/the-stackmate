// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'from-old-xpub.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$XpubImportWalletState implements DiagnosticableTreeMixin {

 XpubImportWalletStep get currentStep; String get label; bool get savingWallet; String get errSavingWallet; bool get newWalletSaved;
/// Create a copy of XpubImportWalletState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$XpubImportWalletStateCopyWith<XpubImportWalletState> get copyWith => _$XpubImportWalletStateCopyWithImpl<XpubImportWalletState>(this as XpubImportWalletState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'XpubImportWalletState'))
    ..add(DiagnosticsProperty('currentStep', currentStep))..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('savingWallet', savingWallet))..add(DiagnosticsProperty('errSavingWallet', errSavingWallet))..add(DiagnosticsProperty('newWalletSaved', newWalletSaved));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is XpubImportWalletState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.label, label) || other.label == label)&&(identical(other.savingWallet, savingWallet) || other.savingWallet == savingWallet)&&(identical(other.errSavingWallet, errSavingWallet) || other.errSavingWallet == errSavingWallet)&&(identical(other.newWalletSaved, newWalletSaved) || other.newWalletSaved == newWalletSaved));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,label,savingWallet,errSavingWallet,newWalletSaved);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'XpubImportWalletState(currentStep: $currentStep, label: $label, savingWallet: $savingWallet, errSavingWallet: $errSavingWallet, newWalletSaved: $newWalletSaved)';
}


}

/// @nodoc
abstract mixin class $XpubImportWalletStateCopyWith<$Res>  {
  factory $XpubImportWalletStateCopyWith(XpubImportWalletState value, $Res Function(XpubImportWalletState) _then) = _$XpubImportWalletStateCopyWithImpl;
@useResult
$Res call({
 XpubImportWalletStep currentStep, String label, bool savingWallet, String errSavingWallet, bool newWalletSaved
});




}
/// @nodoc
class _$XpubImportWalletStateCopyWithImpl<$Res>
    implements $XpubImportWalletStateCopyWith<$Res> {
  _$XpubImportWalletStateCopyWithImpl(this._self, this._then);

  final XpubImportWalletState _self;
  final $Res Function(XpubImportWalletState) _then;

/// Create a copy of XpubImportWalletState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? label = null,Object? savingWallet = null,Object? errSavingWallet = null,Object? newWalletSaved = null,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as XpubImportWalletStep,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,savingWallet: null == savingWallet ? _self.savingWallet : savingWallet // ignore: cast_nullable_to_non_nullable
as bool,errSavingWallet: null == errSavingWallet ? _self.errSavingWallet : errSavingWallet // ignore: cast_nullable_to_non_nullable
as String,newWalletSaved: null == newWalletSaved ? _self.newWalletSaved : newWalletSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [XpubImportWalletState].
extension XpubImportWalletStatePatterns on XpubImportWalletState {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( XpubImportWalletStep currentStep,  String label,  bool savingWallet,  String errSavingWallet,  bool newWalletSaved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeedImportXpubState() when $default != null:
return $default(_that.currentStep,_that.label,_that.savingWallet,_that.errSavingWallet,_that.newWalletSaved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( XpubImportWalletStep currentStep,  String label,  bool savingWallet,  String errSavingWallet,  bool newWalletSaved)  $default,) {final _that = this;
switch (_that) {
case _SeedImportXpubState():
return $default(_that.currentStep,_that.label,_that.savingWallet,_that.errSavingWallet,_that.newWalletSaved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( XpubImportWalletStep currentStep,  String label,  bool savingWallet,  String errSavingWallet,  bool newWalletSaved)?  $default,) {final _that = this;
switch (_that) {
case _SeedImportXpubState() when $default != null:
return $default(_that.currentStep,_that.label,_that.savingWallet,_that.errSavingWallet,_that.newWalletSaved);case _:
  return null;

}
}

}

/// @nodoc


class _SeedImportXpubState extends XpubImportWalletState with DiagnosticableTreeMixin {
  const _SeedImportXpubState({this.currentStep = XpubImportWalletStep.import, this.label = '', this.savingWallet = false, this.errSavingWallet = '', this.newWalletSaved = false}): super._();
  

@override@JsonKey() final  XpubImportWalletStep currentStep;
@override@JsonKey() final  String label;
@override@JsonKey() final  bool savingWallet;
@override@JsonKey() final  String errSavingWallet;
@override@JsonKey() final  bool newWalletSaved;

/// Create a copy of XpubImportWalletState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeedImportXpubStateCopyWith<_SeedImportXpubState> get copyWith => __$SeedImportXpubStateCopyWithImpl<_SeedImportXpubState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'XpubImportWalletState'))
    ..add(DiagnosticsProperty('currentStep', currentStep))..add(DiagnosticsProperty('label', label))..add(DiagnosticsProperty('savingWallet', savingWallet))..add(DiagnosticsProperty('errSavingWallet', errSavingWallet))..add(DiagnosticsProperty('newWalletSaved', newWalletSaved));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeedImportXpubState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.label, label) || other.label == label)&&(identical(other.savingWallet, savingWallet) || other.savingWallet == savingWallet)&&(identical(other.errSavingWallet, errSavingWallet) || other.errSavingWallet == errSavingWallet)&&(identical(other.newWalletSaved, newWalletSaved) || other.newWalletSaved == newWalletSaved));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,label,savingWallet,errSavingWallet,newWalletSaved);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'XpubImportWalletState(currentStep: $currentStep, label: $label, savingWallet: $savingWallet, errSavingWallet: $errSavingWallet, newWalletSaved: $newWalletSaved)';
}


}

/// @nodoc
abstract mixin class _$SeedImportXpubStateCopyWith<$Res> implements $XpubImportWalletStateCopyWith<$Res> {
  factory _$SeedImportXpubStateCopyWith(_SeedImportXpubState value, $Res Function(_SeedImportXpubState) _then) = __$SeedImportXpubStateCopyWithImpl;
@override @useResult
$Res call({
 XpubImportWalletStep currentStep, String label, bool savingWallet, String errSavingWallet, bool newWalletSaved
});




}
/// @nodoc
class __$SeedImportXpubStateCopyWithImpl<$Res>
    implements _$SeedImportXpubStateCopyWith<$Res> {
  __$SeedImportXpubStateCopyWithImpl(this._self, this._then);

  final _SeedImportXpubState _self;
  final $Res Function(_SeedImportXpubState) _then;

/// Create a copy of XpubImportWalletState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? label = null,Object? savingWallet = null,Object? errSavingWallet = null,Object? newWalletSaved = null,}) {
  return _then(_SeedImportXpubState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as XpubImportWalletStep,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,savingWallet: null == savingWallet ? _self.savingWallet : savingWallet // ignore: cast_nullable_to_non_nullable
as bool,errSavingWallet: null == errSavingWallet ? _self.errSavingWallet : errSavingWallet // ignore: cast_nullable_to_non_nullable
as String,newWalletSaved: null == newWalletSaved ? _self.newWalletSaved : newWalletSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
