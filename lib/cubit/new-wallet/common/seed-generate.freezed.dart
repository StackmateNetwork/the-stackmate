// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seed-generate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SeedGenerateState {

 SeedGenerateSteps get currentStep; List<String>? get seed; String? get masterXpriv; String? get xpriv; String? get fingerPrint; DerivedKeys? get wallet; bool get generatingSeed; int get seedLength; String get seedError; int get quizSeedCompleted; String get quizSeedAnswer; int get quizSeedAnswerIdx; List<String> get quizSeedList; List<String> get quizSeedCompletedAnswers; String get quizSeedError; bool get backupLater;
/// Create a copy of SeedGenerateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeedGenerateStateCopyWith<SeedGenerateState> get copyWith => _$SeedGenerateStateCopyWithImpl<SeedGenerateState>(this as SeedGenerateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeedGenerateState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&const DeepCollectionEquality().equals(other.seed, seed)&&(identical(other.masterXpriv, masterXpriv) || other.masterXpriv == masterXpriv)&&(identical(other.xpriv, xpriv) || other.xpriv == xpriv)&&(identical(other.fingerPrint, fingerPrint) || other.fingerPrint == fingerPrint)&&(identical(other.wallet, wallet) || other.wallet == wallet)&&(identical(other.generatingSeed, generatingSeed) || other.generatingSeed == generatingSeed)&&(identical(other.seedLength, seedLength) || other.seedLength == seedLength)&&(identical(other.seedError, seedError) || other.seedError == seedError)&&(identical(other.quizSeedCompleted, quizSeedCompleted) || other.quizSeedCompleted == quizSeedCompleted)&&(identical(other.quizSeedAnswer, quizSeedAnswer) || other.quizSeedAnswer == quizSeedAnswer)&&(identical(other.quizSeedAnswerIdx, quizSeedAnswerIdx) || other.quizSeedAnswerIdx == quizSeedAnswerIdx)&&const DeepCollectionEquality().equals(other.quizSeedList, quizSeedList)&&const DeepCollectionEquality().equals(other.quizSeedCompletedAnswers, quizSeedCompletedAnswers)&&(identical(other.quizSeedError, quizSeedError) || other.quizSeedError == quizSeedError)&&(identical(other.backupLater, backupLater) || other.backupLater == backupLater));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,const DeepCollectionEquality().hash(seed),masterXpriv,xpriv,fingerPrint,wallet,generatingSeed,seedLength,seedError,quizSeedCompleted,quizSeedAnswer,quizSeedAnswerIdx,const DeepCollectionEquality().hash(quizSeedList),const DeepCollectionEquality().hash(quizSeedCompletedAnswers),quizSeedError,backupLater);

@override
String toString() {
  return 'SeedGenerateState(currentStep: $currentStep, seed: $seed, masterXpriv: $masterXpriv, xpriv: $xpriv, fingerPrint: $fingerPrint, wallet: $wallet, generatingSeed: $generatingSeed, seedLength: $seedLength, seedError: $seedError, quizSeedCompleted: $quizSeedCompleted, quizSeedAnswer: $quizSeedAnswer, quizSeedAnswerIdx: $quizSeedAnswerIdx, quizSeedList: $quizSeedList, quizSeedCompletedAnswers: $quizSeedCompletedAnswers, quizSeedError: $quizSeedError, backupLater: $backupLater)';
}


}

/// @nodoc
abstract mixin class $SeedGenerateStateCopyWith<$Res>  {
  factory $SeedGenerateStateCopyWith(SeedGenerateState value, $Res Function(SeedGenerateState) _then) = _$SeedGenerateStateCopyWithImpl;
@useResult
$Res call({
 SeedGenerateSteps currentStep, List<String>? seed, String? masterXpriv, String? xpriv, String? fingerPrint, DerivedKeys? wallet, bool generatingSeed, int seedLength, String seedError, int quizSeedCompleted, String quizSeedAnswer, int quizSeedAnswerIdx, List<String> quizSeedList, List<String> quizSeedCompletedAnswers, String quizSeedError, bool backupLater
});




}
/// @nodoc
class _$SeedGenerateStateCopyWithImpl<$Res>
    implements $SeedGenerateStateCopyWith<$Res> {
  _$SeedGenerateStateCopyWithImpl(this._self, this._then);

  final SeedGenerateState _self;
  final $Res Function(SeedGenerateState) _then;

/// Create a copy of SeedGenerateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? seed = freezed,Object? masterXpriv = freezed,Object? xpriv = freezed,Object? fingerPrint = freezed,Object? wallet = freezed,Object? generatingSeed = null,Object? seedLength = null,Object? seedError = null,Object? quizSeedCompleted = null,Object? quizSeedAnswer = null,Object? quizSeedAnswerIdx = null,Object? quizSeedList = null,Object? quizSeedCompletedAnswers = null,Object? quizSeedError = null,Object? backupLater = null,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as SeedGenerateSteps,seed: freezed == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as List<String>?,masterXpriv: freezed == masterXpriv ? _self.masterXpriv : masterXpriv // ignore: cast_nullable_to_non_nullable
as String?,xpriv: freezed == xpriv ? _self.xpriv : xpriv // ignore: cast_nullable_to_non_nullable
as String?,fingerPrint: freezed == fingerPrint ? _self.fingerPrint : fingerPrint // ignore: cast_nullable_to_non_nullable
as String?,wallet: freezed == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as DerivedKeys?,generatingSeed: null == generatingSeed ? _self.generatingSeed : generatingSeed // ignore: cast_nullable_to_non_nullable
as bool,seedLength: null == seedLength ? _self.seedLength : seedLength // ignore: cast_nullable_to_non_nullable
as int,seedError: null == seedError ? _self.seedError : seedError // ignore: cast_nullable_to_non_nullable
as String,quizSeedCompleted: null == quizSeedCompleted ? _self.quizSeedCompleted : quizSeedCompleted // ignore: cast_nullable_to_non_nullable
as int,quizSeedAnswer: null == quizSeedAnswer ? _self.quizSeedAnswer : quizSeedAnswer // ignore: cast_nullable_to_non_nullable
as String,quizSeedAnswerIdx: null == quizSeedAnswerIdx ? _self.quizSeedAnswerIdx : quizSeedAnswerIdx // ignore: cast_nullable_to_non_nullable
as int,quizSeedList: null == quizSeedList ? _self.quizSeedList : quizSeedList // ignore: cast_nullable_to_non_nullable
as List<String>,quizSeedCompletedAnswers: null == quizSeedCompletedAnswers ? _self.quizSeedCompletedAnswers : quizSeedCompletedAnswers // ignore: cast_nullable_to_non_nullable
as List<String>,quizSeedError: null == quizSeedError ? _self.quizSeedError : quizSeedError // ignore: cast_nullable_to_non_nullable
as String,backupLater: null == backupLater ? _self.backupLater : backupLater // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SeedGenerateState].
extension SeedGenerateStatePatterns on SeedGenerateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeedGenerateState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeedGenerateState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeedGenerateState value)  $default,){
final _that = this;
switch (_that) {
case _SeedGenerateState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeedGenerateState value)?  $default,){
final _that = this;
switch (_that) {
case _SeedGenerateState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SeedGenerateSteps currentStep,  List<String>? seed,  String? masterXpriv,  String? xpriv,  String? fingerPrint,  DerivedKeys? wallet,  bool generatingSeed,  int seedLength,  String seedError,  int quizSeedCompleted,  String quizSeedAnswer,  int quizSeedAnswerIdx,  List<String> quizSeedList,  List<String> quizSeedCompletedAnswers,  String quizSeedError,  bool backupLater)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeedGenerateState() when $default != null:
return $default(_that.currentStep,_that.seed,_that.masterXpriv,_that.xpriv,_that.fingerPrint,_that.wallet,_that.generatingSeed,_that.seedLength,_that.seedError,_that.quizSeedCompleted,_that.quizSeedAnswer,_that.quizSeedAnswerIdx,_that.quizSeedList,_that.quizSeedCompletedAnswers,_that.quizSeedError,_that.backupLater);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SeedGenerateSteps currentStep,  List<String>? seed,  String? masterXpriv,  String? xpriv,  String? fingerPrint,  DerivedKeys? wallet,  bool generatingSeed,  int seedLength,  String seedError,  int quizSeedCompleted,  String quizSeedAnswer,  int quizSeedAnswerIdx,  List<String> quizSeedList,  List<String> quizSeedCompletedAnswers,  String quizSeedError,  bool backupLater)  $default,) {final _that = this;
switch (_that) {
case _SeedGenerateState():
return $default(_that.currentStep,_that.seed,_that.masterXpriv,_that.xpriv,_that.fingerPrint,_that.wallet,_that.generatingSeed,_that.seedLength,_that.seedError,_that.quizSeedCompleted,_that.quizSeedAnswer,_that.quizSeedAnswerIdx,_that.quizSeedList,_that.quizSeedCompletedAnswers,_that.quizSeedError,_that.backupLater);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SeedGenerateSteps currentStep,  List<String>? seed,  String? masterXpriv,  String? xpriv,  String? fingerPrint,  DerivedKeys? wallet,  bool generatingSeed,  int seedLength,  String seedError,  int quizSeedCompleted,  String quizSeedAnswer,  int quizSeedAnswerIdx,  List<String> quizSeedList,  List<String> quizSeedCompletedAnswers,  String quizSeedError,  bool backupLater)?  $default,) {final _that = this;
switch (_that) {
case _SeedGenerateState() when $default != null:
return $default(_that.currentStep,_that.seed,_that.masterXpriv,_that.xpriv,_that.fingerPrint,_that.wallet,_that.generatingSeed,_that.seedLength,_that.seedError,_that.quizSeedCompleted,_that.quizSeedAnswer,_that.quizSeedAnswerIdx,_that.quizSeedList,_that.quizSeedCompletedAnswers,_that.quizSeedError,_that.backupLater);case _:
  return null;

}
}

}

/// @nodoc


class _SeedGenerateState extends SeedGenerateState {
  const _SeedGenerateState({this.currentStep = SeedGenerateSteps.generate, final  List<String>? seed, this.masterXpriv, this.xpriv, this.fingerPrint, this.wallet, this.generatingSeed = false, this.seedLength = 12, this.seedError = '', this.quizSeedCompleted = 0, this.quizSeedAnswer = '', this.quizSeedAnswerIdx = -1, final  List<String> quizSeedList = const [], final  List<String> quizSeedCompletedAnswers = const [], this.quizSeedError = '', this.backupLater = false}): _seed = seed,_quizSeedList = quizSeedList,_quizSeedCompletedAnswers = quizSeedCompletedAnswers,super._();
  

@override@JsonKey() final  SeedGenerateSteps currentStep;
 final  List<String>? _seed;
@override List<String>? get seed {
  final value = _seed;
  if (value == null) return null;
  if (_seed is EqualUnmodifiableListView) return _seed;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? masterXpriv;
@override final  String? xpriv;
@override final  String? fingerPrint;
@override final  DerivedKeys? wallet;
@override@JsonKey() final  bool generatingSeed;
@override@JsonKey() final  int seedLength;
@override@JsonKey() final  String seedError;
@override@JsonKey() final  int quizSeedCompleted;
@override@JsonKey() final  String quizSeedAnswer;
@override@JsonKey() final  int quizSeedAnswerIdx;
 final  List<String> _quizSeedList;
@override@JsonKey() List<String> get quizSeedList {
  if (_quizSeedList is EqualUnmodifiableListView) return _quizSeedList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quizSeedList);
}

 final  List<String> _quizSeedCompletedAnswers;
@override@JsonKey() List<String> get quizSeedCompletedAnswers {
  if (_quizSeedCompletedAnswers is EqualUnmodifiableListView) return _quizSeedCompletedAnswers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quizSeedCompletedAnswers);
}

@override@JsonKey() final  String quizSeedError;
@override@JsonKey() final  bool backupLater;

/// Create a copy of SeedGenerateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeedGenerateStateCopyWith<_SeedGenerateState> get copyWith => __$SeedGenerateStateCopyWithImpl<_SeedGenerateState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeedGenerateState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&const DeepCollectionEquality().equals(other._seed, _seed)&&(identical(other.masterXpriv, masterXpriv) || other.masterXpriv == masterXpriv)&&(identical(other.xpriv, xpriv) || other.xpriv == xpriv)&&(identical(other.fingerPrint, fingerPrint) || other.fingerPrint == fingerPrint)&&(identical(other.wallet, wallet) || other.wallet == wallet)&&(identical(other.generatingSeed, generatingSeed) || other.generatingSeed == generatingSeed)&&(identical(other.seedLength, seedLength) || other.seedLength == seedLength)&&(identical(other.seedError, seedError) || other.seedError == seedError)&&(identical(other.quizSeedCompleted, quizSeedCompleted) || other.quizSeedCompleted == quizSeedCompleted)&&(identical(other.quizSeedAnswer, quizSeedAnswer) || other.quizSeedAnswer == quizSeedAnswer)&&(identical(other.quizSeedAnswerIdx, quizSeedAnswerIdx) || other.quizSeedAnswerIdx == quizSeedAnswerIdx)&&const DeepCollectionEquality().equals(other._quizSeedList, _quizSeedList)&&const DeepCollectionEquality().equals(other._quizSeedCompletedAnswers, _quizSeedCompletedAnswers)&&(identical(other.quizSeedError, quizSeedError) || other.quizSeedError == quizSeedError)&&(identical(other.backupLater, backupLater) || other.backupLater == backupLater));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,const DeepCollectionEquality().hash(_seed),masterXpriv,xpriv,fingerPrint,wallet,generatingSeed,seedLength,seedError,quizSeedCompleted,quizSeedAnswer,quizSeedAnswerIdx,const DeepCollectionEquality().hash(_quizSeedList),const DeepCollectionEquality().hash(_quizSeedCompletedAnswers),quizSeedError,backupLater);

@override
String toString() {
  return 'SeedGenerateState(currentStep: $currentStep, seed: $seed, masterXpriv: $masterXpriv, xpriv: $xpriv, fingerPrint: $fingerPrint, wallet: $wallet, generatingSeed: $generatingSeed, seedLength: $seedLength, seedError: $seedError, quizSeedCompleted: $quizSeedCompleted, quizSeedAnswer: $quizSeedAnswer, quizSeedAnswerIdx: $quizSeedAnswerIdx, quizSeedList: $quizSeedList, quizSeedCompletedAnswers: $quizSeedCompletedAnswers, quizSeedError: $quizSeedError, backupLater: $backupLater)';
}


}

/// @nodoc
abstract mixin class _$SeedGenerateStateCopyWith<$Res> implements $SeedGenerateStateCopyWith<$Res> {
  factory _$SeedGenerateStateCopyWith(_SeedGenerateState value, $Res Function(_SeedGenerateState) _then) = __$SeedGenerateStateCopyWithImpl;
@override @useResult
$Res call({
 SeedGenerateSteps currentStep, List<String>? seed, String? masterXpriv, String? xpriv, String? fingerPrint, DerivedKeys? wallet, bool generatingSeed, int seedLength, String seedError, int quizSeedCompleted, String quizSeedAnswer, int quizSeedAnswerIdx, List<String> quizSeedList, List<String> quizSeedCompletedAnswers, String quizSeedError, bool backupLater
});




}
/// @nodoc
class __$SeedGenerateStateCopyWithImpl<$Res>
    implements _$SeedGenerateStateCopyWith<$Res> {
  __$SeedGenerateStateCopyWithImpl(this._self, this._then);

  final _SeedGenerateState _self;
  final $Res Function(_SeedGenerateState) _then;

/// Create a copy of SeedGenerateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? seed = freezed,Object? masterXpriv = freezed,Object? xpriv = freezed,Object? fingerPrint = freezed,Object? wallet = freezed,Object? generatingSeed = null,Object? seedLength = null,Object? seedError = null,Object? quizSeedCompleted = null,Object? quizSeedAnswer = null,Object? quizSeedAnswerIdx = null,Object? quizSeedList = null,Object? quizSeedCompletedAnswers = null,Object? quizSeedError = null,Object? backupLater = null,}) {
  return _then(_SeedGenerateState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as SeedGenerateSteps,seed: freezed == seed ? _self._seed : seed // ignore: cast_nullable_to_non_nullable
as List<String>?,masterXpriv: freezed == masterXpriv ? _self.masterXpriv : masterXpriv // ignore: cast_nullable_to_non_nullable
as String?,xpriv: freezed == xpriv ? _self.xpriv : xpriv // ignore: cast_nullable_to_non_nullable
as String?,fingerPrint: freezed == fingerPrint ? _self.fingerPrint : fingerPrint // ignore: cast_nullable_to_non_nullable
as String?,wallet: freezed == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as DerivedKeys?,generatingSeed: null == generatingSeed ? _self.generatingSeed : generatingSeed // ignore: cast_nullable_to_non_nullable
as bool,seedLength: null == seedLength ? _self.seedLength : seedLength // ignore: cast_nullable_to_non_nullable
as int,seedError: null == seedError ? _self.seedError : seedError // ignore: cast_nullable_to_non_nullable
as String,quizSeedCompleted: null == quizSeedCompleted ? _self.quizSeedCompleted : quizSeedCompleted // ignore: cast_nullable_to_non_nullable
as int,quizSeedAnswer: null == quizSeedAnswer ? _self.quizSeedAnswer : quizSeedAnswer // ignore: cast_nullable_to_non_nullable
as String,quizSeedAnswerIdx: null == quizSeedAnswerIdx ? _self.quizSeedAnswerIdx : quizSeedAnswerIdx // ignore: cast_nullable_to_non_nullable
as int,quizSeedList: null == quizSeedList ? _self._quizSeedList : quizSeedList // ignore: cast_nullable_to_non_nullable
as List<String>,quizSeedCompletedAnswers: null == quizSeedCompletedAnswers ? _self._quizSeedCompletedAnswers : quizSeedCompletedAnswers // ignore: cast_nullable_to_non_nullable
as List<String>,quizSeedError: null == quizSeedError ? _self.quizSeedError : quizSeedError // ignore: cast_nullable_to_non_nullable
as String,backupLater: null == backupLater ? _self.backupLater : backupLater // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
