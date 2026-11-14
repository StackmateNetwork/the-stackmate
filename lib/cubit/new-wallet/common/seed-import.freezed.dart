// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seed-import.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SeedImportState {

 List<String> get words; int get wordCount; SeedImportStep get currentStep; String get seed; String get seedError; String get passPhrase; int get accountNumber; String get errPassPhrase; bool get seedReady; String? get masterXpriv; DerivedKeys? get wallet;
/// Create a copy of SeedImportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeedImportStateCopyWith<SeedImportState> get copyWith => _$SeedImportStateCopyWithImpl<SeedImportState>(this as SeedImportState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SeedImportState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeedImportState&&const DeepCollectionEquality().equals(other.words, _this.words)&&(identical(other.wordCount, _this.wordCount) || other.wordCount == _this.wordCount)&&(identical(other.currentStep, _this.currentStep) || other.currentStep == _this.currentStep)&&(identical(other.seed, _this.seed) || other.seed == _this.seed)&&(identical(other.seedError, _this.seedError) || other.seedError == _this.seedError)&&(identical(other.passPhrase, _this.passPhrase) || other.passPhrase == _this.passPhrase)&&(identical(other.accountNumber, _this.accountNumber) || other.accountNumber == _this.accountNumber)&&(identical(other.errPassPhrase, _this.errPassPhrase) || other.errPassPhrase == _this.errPassPhrase)&&(identical(other.seedReady, _this.seedReady) || other.seedReady == _this.seedReady)&&(identical(other.masterXpriv, _this.masterXpriv) || other.masterXpriv == _this.masterXpriv)&&(identical(other.wallet, _this.wallet) || other.wallet == _this.wallet));
}


@override
int get hashCode {
  final _this = this as SeedImportState;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.words),_this.wordCount,_this.currentStep,_this.seed,_this.seedError,_this.passPhrase,_this.accountNumber,_this.errPassPhrase,_this.seedReady,_this.masterXpriv,_this.wallet);
}

@override
String toString() {
  final _this = this as SeedImportState;
  return 'SeedImportState(words: ${_this.words}, wordCount: ${_this.wordCount}, currentStep: ${_this.currentStep}, seed: ${_this.seed}, seedError: ${_this.seedError}, passPhrase: ${_this.passPhrase}, accountNumber: ${_this.accountNumber}, errPassPhrase: ${_this.errPassPhrase}, seedReady: ${_this.seedReady}, masterXpriv: ${_this.masterXpriv}, wallet: ${_this.wallet})';
}


}

/// @nodoc
abstract mixin class $SeedImportStateCopyWith<$Res>  {
  factory $SeedImportStateCopyWith(SeedImportState value, $Res Function(SeedImportState) _then) = _$SeedImportStateCopyWithImpl;
@useResult
$Res call({
 List<String> words, int wordCount, SeedImportStep currentStep, String seed, String seedError, String passPhrase, int accountNumber, String errPassPhrase, bool seedReady, String? masterXpriv, DerivedKeys? wallet
});




}
/// @nodoc
class _$SeedImportStateCopyWithImpl<$Res>
    implements $SeedImportStateCopyWith<$Res> {
  _$SeedImportStateCopyWithImpl(this._self, this._then);

  final SeedImportState _self;
  final $Res Function(SeedImportState) _then;

/// Create a copy of SeedImportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? words = null,Object? wordCount = null,Object? currentStep = null,Object? seed = null,Object? seedError = null,Object? passPhrase = null,Object? accountNumber = null,Object? errPassPhrase = null,Object? seedReady = null,Object? masterXpriv = freezed,Object? wallet = freezed,}) {
  return _then(SeedImportState(
words: null == words ? _self.words : words // ignore: cast_nullable_to_non_nullable
as List<String>,wordCount: null == wordCount ? _self.wordCount : wordCount // ignore: cast_nullable_to_non_nullable
as int,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as SeedImportStep,seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as String,seedError: null == seedError ? _self.seedError : seedError // ignore: cast_nullable_to_non_nullable
as String,passPhrase: null == passPhrase ? _self.passPhrase : passPhrase // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as int,errPassPhrase: null == errPassPhrase ? _self.errPassPhrase : errPassPhrase // ignore: cast_nullable_to_non_nullable
as String,seedReady: null == seedReady ? _self.seedReady : seedReady // ignore: cast_nullable_to_non_nullable
as bool,masterXpriv: freezed == masterXpriv ? _self.masterXpriv : masterXpriv // ignore: cast_nullable_to_non_nullable
as String?,wallet: freezed == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as DerivedKeys?,
  ));
}

}


/// Adds pattern-matching-related methods to [SeedImportState].
extension SeedImportStatePatterns on SeedImportState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeedImportState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeedImportState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeedImportState value)  $default,){
final _that = this;
switch (_that) {
case _SeedImportState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeedImportState value)?  $default,){
final _that = this;
switch (_that) {
case _SeedImportState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> words,  int wordCount,  SeedImportStep currentStep,  String seed,  String seedError,  String passPhrase,  int accountNumber,  String errPassPhrase,  bool seedReady,  String? masterXpriv,  DerivedKeys? wallet)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeedImportState() when $default != null:
return $default(_that.words,_that.wordCount,_that.currentStep,_that.seed,_that.seedError,_that.passPhrase,_that.accountNumber,_that.errPassPhrase,_that.seedReady,_that.masterXpriv,_that.wallet);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> words,  int wordCount,  SeedImportStep currentStep,  String seed,  String seedError,  String passPhrase,  int accountNumber,  String errPassPhrase,  bool seedReady,  String? masterXpriv,  DerivedKeys? wallet)  $default,) {final _that = this;
switch (_that) {
case _SeedImportState():
return $default(_that.words,_that.wordCount,_that.currentStep,_that.seed,_that.seedError,_that.passPhrase,_that.accountNumber,_that.errPassPhrase,_that.seedReady,_that.masterXpriv,_that.wallet);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> words,  int wordCount,  SeedImportStep currentStep,  String seed,  String seedError,  String passPhrase,  int accountNumber,  String errPassPhrase,  bool seedReady,  String? masterXpriv,  DerivedKeys? wallet)?  $default,) {final _that = this;
switch (_that) {
case _SeedImportState() when $default != null:
return $default(_that.words,_that.wordCount,_that.currentStep,_that.seed,_that.seedError,_that.passPhrase,_that.accountNumber,_that.errPassPhrase,_that.seedReady,_that.masterXpriv,_that.wallet);case _:
  return null;

}
}

}

/// @nodoc


class _SeedImportState extends SeedImportState {
  const _SeedImportState({ List<String> words = const <String>[], this.wordCount = 12, this.currentStep = SeedImportStep.import, this.seed = '', this.seedError = '', this.passPhrase = '', this.accountNumber = 0, this.errPassPhrase = '', this.seedReady = false, this.masterXpriv, this.wallet}): _words = words,super._();
  

 final  List<String> _words;
@override@JsonKey() List<String> get words {
  if (_words is EqualUnmodifiableListView) return _words;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_words);
}

@override@JsonKey() final  int wordCount;
@override@JsonKey() final  SeedImportStep currentStep;
@override@JsonKey() final  String seed;
@override@JsonKey() final  String seedError;
@override@JsonKey() final  String passPhrase;
@override@JsonKey() final  int accountNumber;
@override@JsonKey() final  String errPassPhrase;
@override@JsonKey() final  bool seedReady;
@override final  String? masterXpriv;
@override final  DerivedKeys? wallet;

/// Create a copy of SeedImportState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeedImportStateCopyWith<_SeedImportState> get copyWith => __$SeedImportStateCopyWithImpl<_SeedImportState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeedImportState&&const DeepCollectionEquality().equals(other.words, _words)&&(identical(other.wordCount, wordCount) || other.wordCount == wordCount)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.seedError, seedError) || other.seedError == seedError)&&(identical(other.passPhrase, passPhrase) || other.passPhrase == passPhrase)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.errPassPhrase, errPassPhrase) || other.errPassPhrase == errPassPhrase)&&(identical(other.seedReady, seedReady) || other.seedReady == seedReady)&&(identical(other.masterXpriv, masterXpriv) || other.masterXpriv == masterXpriv)&&(identical(other.wallet, wallet) || other.wallet == wallet));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_words),wordCount,currentStep,seed,seedError,passPhrase,accountNumber,errPassPhrase,seedReady,masterXpriv,wallet);
}

@override
String toString() {
    return 'SeedImportState(words: $words, wordCount: $wordCount, currentStep: $currentStep, seed: $seed, seedError: $seedError, passPhrase: $passPhrase, accountNumber: $accountNumber, errPassPhrase: $errPassPhrase, seedReady: $seedReady, masterXpriv: $masterXpriv, wallet: $wallet)';
}


}

/// @nodoc
abstract mixin class _$SeedImportStateCopyWith<$Res> implements $SeedImportStateCopyWith<$Res> {
  factory _$SeedImportStateCopyWith(_SeedImportState value, $Res Function(_SeedImportState) _then) = __$SeedImportStateCopyWithImpl;
@override @useResult
$Res call({
 List<String> words, int wordCount, SeedImportStep currentStep, String seed, String seedError, String passPhrase, int accountNumber, String errPassPhrase, bool seedReady, String? masterXpriv, DerivedKeys? wallet
});




}
/// @nodoc
class __$SeedImportStateCopyWithImpl<$Res>
    implements _$SeedImportStateCopyWith<$Res> {
  __$SeedImportStateCopyWithImpl(this._self, this._then);

  final _SeedImportState _self;
  final $Res Function(_SeedImportState) _then;

/// Create a copy of SeedImportState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? words = null,Object? wordCount = null,Object? currentStep = null,Object? seed = null,Object? seedError = null,Object? passPhrase = null,Object? accountNumber = null,Object? errPassPhrase = null,Object? seedReady = null,Object? masterXpriv = freezed,Object? wallet = freezed,}) {
  return _then(_SeedImportState(
words: null == words ? _self._words : words // ignore: cast_nullable_to_non_nullable
as List<String>,wordCount: null == wordCount ? _self.wordCount : wordCount // ignore: cast_nullable_to_non_nullable
as int,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as SeedImportStep,seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as String,seedError: null == seedError ? _self.seedError : seedError // ignore: cast_nullable_to_non_nullable
as String,passPhrase: null == passPhrase ? _self.passPhrase : passPhrase // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as int,errPassPhrase: null == errPassPhrase ? _self.errPassPhrase : errPassPhrase // ignore: cast_nullable_to_non_nullable
as String,seedReady: null == seedReady ? _self.seedReady : seedReady // ignore: cast_nullable_to_non_nullable
as bool,masterXpriv: freezed == masterXpriv ? _self.masterXpriv : masterXpriv // ignore: cast_nullable_to_non_nullable
as String?,wallet: freezed == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as DerivedKeys?,
  ));
}


}

// dart format on
