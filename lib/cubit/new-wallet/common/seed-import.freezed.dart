// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seed-import.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SeedImportState {

 List<({String word, bool tapped})> get words12; List<({String word, bool tapped})> get words24; SeedImportStep get currentStep; ImportTypes get importType; String get err; bool get loading; String get seed; String get seedError; String get passPhrase; int get accountNumber; String get errPassPhrase; bool get seedReady; String? get masterXpriv; DerivedKeys? get wallet;
/// Create a copy of SeedImportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeedImportStateCopyWith<SeedImportState> get copyWith => _$SeedImportStateCopyWithImpl<SeedImportState>(this as SeedImportState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeedImportState&&const DeepCollectionEquality().equals(other.words12, words12)&&const DeepCollectionEquality().equals(other.words24, words24)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.importType, importType) || other.importType == importType)&&(identical(other.err, err) || other.err == err)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.seedError, seedError) || other.seedError == seedError)&&(identical(other.passPhrase, passPhrase) || other.passPhrase == passPhrase)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.errPassPhrase, errPassPhrase) || other.errPassPhrase == errPassPhrase)&&(identical(other.seedReady, seedReady) || other.seedReady == seedReady)&&(identical(other.masterXpriv, masterXpriv) || other.masterXpriv == masterXpriv)&&(identical(other.wallet, wallet) || other.wallet == wallet));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(words12),const DeepCollectionEquality().hash(words24),currentStep,importType,err,loading,seed,seedError,passPhrase,accountNumber,errPassPhrase,seedReady,masterXpriv,wallet);

@override
String toString() {
  return 'SeedImportState(words12: $words12, words24: $words24, currentStep: $currentStep, importType: $importType, err: $err, loading: $loading, seed: $seed, seedError: $seedError, passPhrase: $passPhrase, accountNumber: $accountNumber, errPassPhrase: $errPassPhrase, seedReady: $seedReady, masterXpriv: $masterXpriv, wallet: $wallet)';
}


}

/// @nodoc
abstract mixin class $SeedImportStateCopyWith<$Res>  {
  factory $SeedImportStateCopyWith(SeedImportState value, $Res Function(SeedImportState) _then) = _$SeedImportStateCopyWithImpl;
@useResult
$Res call({
 List<({String word, bool tapped})> words12, List<({String word, bool tapped})> words24, SeedImportStep currentStep, ImportTypes importType, String err, bool loading, String seed, String seedError, String passPhrase, int accountNumber, String errPassPhrase, bool seedReady, String? masterXpriv, DerivedKeys? wallet
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
@pragma('vm:prefer-inline') @override $Res call({Object? words12 = null,Object? words24 = null,Object? currentStep = null,Object? importType = null,Object? err = null,Object? loading = null,Object? seed = null,Object? seedError = null,Object? passPhrase = null,Object? accountNumber = null,Object? errPassPhrase = null,Object? seedReady = null,Object? masterXpriv = freezed,Object? wallet = freezed,}) {
  return _then(_self.copyWith(
words12: null == words12 ? _self.words12 : words12 // ignore: cast_nullable_to_non_nullable
as List<({String word, bool tapped})>,words24: null == words24 ? _self.words24 : words24 // ignore: cast_nullable_to_non_nullable
as List<({String word, bool tapped})>,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as SeedImportStep,importType: null == importType ? _self.importType : importType // ignore: cast_nullable_to_non_nullable
as ImportTypes,err: null == err ? _self.err : err // ignore: cast_nullable_to_non_nullable
as String,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<({String word, bool tapped})> words12,  List<({String word, bool tapped})> words24,  SeedImportStep currentStep,  ImportTypes importType,  String err,  bool loading,  String seed,  String seedError,  String passPhrase,  int accountNumber,  String errPassPhrase,  bool seedReady,  String? masterXpriv,  DerivedKeys? wallet)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeedImportState() when $default != null:
return $default(_that.words12,_that.words24,_that.currentStep,_that.importType,_that.err,_that.loading,_that.seed,_that.seedError,_that.passPhrase,_that.accountNumber,_that.errPassPhrase,_that.seedReady,_that.masterXpriv,_that.wallet);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<({String word, bool tapped})> words12,  List<({String word, bool tapped})> words24,  SeedImportStep currentStep,  ImportTypes importType,  String err,  bool loading,  String seed,  String seedError,  String passPhrase,  int accountNumber,  String errPassPhrase,  bool seedReady,  String? masterXpriv,  DerivedKeys? wallet)  $default,) {final _that = this;
switch (_that) {
case _SeedImportState():
return $default(_that.words12,_that.words24,_that.currentStep,_that.importType,_that.err,_that.loading,_that.seed,_that.seedError,_that.passPhrase,_that.accountNumber,_that.errPassPhrase,_that.seedReady,_that.masterXpriv,_that.wallet);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<({String word, bool tapped})> words12,  List<({String word, bool tapped})> words24,  SeedImportStep currentStep,  ImportTypes importType,  String err,  bool loading,  String seed,  String seedError,  String passPhrase,  int accountNumber,  String errPassPhrase,  bool seedReady,  String? masterXpriv,  DerivedKeys? wallet)?  $default,) {final _that = this;
switch (_that) {
case _SeedImportState() when $default != null:
return $default(_that.words12,_that.words24,_that.currentStep,_that.importType,_that.err,_that.loading,_that.seed,_that.seedError,_that.passPhrase,_that.accountNumber,_that.errPassPhrase,_that.seedReady,_that.masterXpriv,_that.wallet);case _:
  return null;

}
}

}

/// @nodoc


class _SeedImportState extends SeedImportState {
  const _SeedImportState({final  List<({String word, bool tapped})> words12 = const [], final  List<({String word, bool tapped})> words24 = const [], this.currentStep = SeedImportStep.import, this.importType = ImportTypes.words12, this.err = '', this.loading = false, this.seed = '', this.seedError = '', this.passPhrase = '', this.accountNumber = 0, this.errPassPhrase = '', this.seedReady = false, this.masterXpriv, this.wallet}): _words12 = words12,_words24 = words24,super._();
  

 final  List<({String word, bool tapped})> _words12;
@override@JsonKey() List<({String word, bool tapped})> get words12 {
  if (_words12 is EqualUnmodifiableListView) return _words12;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_words12);
}

 final  List<({String word, bool tapped})> _words24;
@override@JsonKey() List<({String word, bool tapped})> get words24 {
  if (_words24 is EqualUnmodifiableListView) return _words24;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_words24);
}

@override@JsonKey() final  SeedImportStep currentStep;
@override@JsonKey() final  ImportTypes importType;
@override@JsonKey() final  String err;
@override@JsonKey() final  bool loading;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeedImportState&&const DeepCollectionEquality().equals(other._words12, _words12)&&const DeepCollectionEquality().equals(other._words24, _words24)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.importType, importType) || other.importType == importType)&&(identical(other.err, err) || other.err == err)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.seedError, seedError) || other.seedError == seedError)&&(identical(other.passPhrase, passPhrase) || other.passPhrase == passPhrase)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.errPassPhrase, errPassPhrase) || other.errPassPhrase == errPassPhrase)&&(identical(other.seedReady, seedReady) || other.seedReady == seedReady)&&(identical(other.masterXpriv, masterXpriv) || other.masterXpriv == masterXpriv)&&(identical(other.wallet, wallet) || other.wallet == wallet));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_words12),const DeepCollectionEquality().hash(_words24),currentStep,importType,err,loading,seed,seedError,passPhrase,accountNumber,errPassPhrase,seedReady,masterXpriv,wallet);

@override
String toString() {
  return 'SeedImportState(words12: $words12, words24: $words24, currentStep: $currentStep, importType: $importType, err: $err, loading: $loading, seed: $seed, seedError: $seedError, passPhrase: $passPhrase, accountNumber: $accountNumber, errPassPhrase: $errPassPhrase, seedReady: $seedReady, masterXpriv: $masterXpriv, wallet: $wallet)';
}


}

/// @nodoc
abstract mixin class _$SeedImportStateCopyWith<$Res> implements $SeedImportStateCopyWith<$Res> {
  factory _$SeedImportStateCopyWith(_SeedImportState value, $Res Function(_SeedImportState) _then) = __$SeedImportStateCopyWithImpl;
@override @useResult
$Res call({
 List<({String word, bool tapped})> words12, List<({String word, bool tapped})> words24, SeedImportStep currentStep, ImportTypes importType, String err, bool loading, String seed, String seedError, String passPhrase, int accountNumber, String errPassPhrase, bool seedReady, String? masterXpriv, DerivedKeys? wallet
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
@override @pragma('vm:prefer-inline') $Res call({Object? words12 = null,Object? words24 = null,Object? currentStep = null,Object? importType = null,Object? err = null,Object? loading = null,Object? seed = null,Object? seedError = null,Object? passPhrase = null,Object? accountNumber = null,Object? errPassPhrase = null,Object? seedReady = null,Object? masterXpriv = freezed,Object? wallet = freezed,}) {
  return _then(_SeedImportState(
words12: null == words12 ? _self._words12 : words12 // ignore: cast_nullable_to_non_nullable
as List<({String word, bool tapped})>,words24: null == words24 ? _self._words24 : words24 // ignore: cast_nullable_to_non_nullable
as List<({String word, bool tapped})>,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as SeedImportStep,importType: null == importType ? _self.importType : importType // ignore: cast_nullable_to_non_nullable
as ImportTypes,err: null == err ? _self.err : err // ignore: cast_nullable_to_non_nullable
as String,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,seed: null == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
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
