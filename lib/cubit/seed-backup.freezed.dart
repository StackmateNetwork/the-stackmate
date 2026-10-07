// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seed-backup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SeedBackupState {

 SeedBackupSteps get currentStep; List<String>? get seed; String? get rootXprv; String? get fingerPrint; int get quizSeedCompleted; String get quizSeedAnswer; int get quizSeedAnswerIdx; List<String> get quizSeedList; List<String> get quizSeedCompletedAnswers; String get quizSeedError; String get errMasterKeyUpdate; bool get backupLater; bool get backupComplete;
/// Create a copy of SeedBackupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeedBackupStateCopyWith<SeedBackupState> get copyWith => _$SeedBackupStateCopyWithImpl<SeedBackupState>(this as SeedBackupState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeedBackupState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&const DeepCollectionEquality().equals(other.seed, seed)&&(identical(other.rootXprv, rootXprv) || other.rootXprv == rootXprv)&&(identical(other.fingerPrint, fingerPrint) || other.fingerPrint == fingerPrint)&&(identical(other.quizSeedCompleted, quizSeedCompleted) || other.quizSeedCompleted == quizSeedCompleted)&&(identical(other.quizSeedAnswer, quizSeedAnswer) || other.quizSeedAnswer == quizSeedAnswer)&&(identical(other.quizSeedAnswerIdx, quizSeedAnswerIdx) || other.quizSeedAnswerIdx == quizSeedAnswerIdx)&&const DeepCollectionEquality().equals(other.quizSeedList, quizSeedList)&&const DeepCollectionEquality().equals(other.quizSeedCompletedAnswers, quizSeedCompletedAnswers)&&(identical(other.quizSeedError, quizSeedError) || other.quizSeedError == quizSeedError)&&(identical(other.errMasterKeyUpdate, errMasterKeyUpdate) || other.errMasterKeyUpdate == errMasterKeyUpdate)&&(identical(other.backupLater, backupLater) || other.backupLater == backupLater)&&(identical(other.backupComplete, backupComplete) || other.backupComplete == backupComplete));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,const DeepCollectionEquality().hash(seed),rootXprv,fingerPrint,quizSeedCompleted,quizSeedAnswer,quizSeedAnswerIdx,const DeepCollectionEquality().hash(quizSeedList),const DeepCollectionEquality().hash(quizSeedCompletedAnswers),quizSeedError,errMasterKeyUpdate,backupLater,backupComplete);

@override
String toString() {
  return 'SeedBackupState(currentStep: $currentStep, seed: $seed, rootXprv: $rootXprv, fingerPrint: $fingerPrint, quizSeedCompleted: $quizSeedCompleted, quizSeedAnswer: $quizSeedAnswer, quizSeedAnswerIdx: $quizSeedAnswerIdx, quizSeedList: $quizSeedList, quizSeedCompletedAnswers: $quizSeedCompletedAnswers, quizSeedError: $quizSeedError, errMasterKeyUpdate: $errMasterKeyUpdate, backupLater: $backupLater, backupComplete: $backupComplete)';
}


}

/// @nodoc
abstract mixin class $SeedBackupStateCopyWith<$Res>  {
  factory $SeedBackupStateCopyWith(SeedBackupState value, $Res Function(SeedBackupState) _then) = _$SeedBackupStateCopyWithImpl;
@useResult
$Res call({
 SeedBackupSteps currentStep, List<String>? seed, String? rootXprv, String? fingerPrint, int quizSeedCompleted, String quizSeedAnswer, int quizSeedAnswerIdx, List<String> quizSeedList, List<String> quizSeedCompletedAnswers, String quizSeedError, String errMasterKeyUpdate, bool backupLater, bool backupComplete
});




}
/// @nodoc
class _$SeedBackupStateCopyWithImpl<$Res>
    implements $SeedBackupStateCopyWith<$Res> {
  _$SeedBackupStateCopyWithImpl(this._self, this._then);

  final SeedBackupState _self;
  final $Res Function(SeedBackupState) _then;

/// Create a copy of SeedBackupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStep = null,Object? seed = freezed,Object? rootXprv = freezed,Object? fingerPrint = freezed,Object? quizSeedCompleted = null,Object? quizSeedAnswer = null,Object? quizSeedAnswerIdx = null,Object? quizSeedList = null,Object? quizSeedCompletedAnswers = null,Object? quizSeedError = null,Object? errMasterKeyUpdate = null,Object? backupLater = null,Object? backupComplete = null,}) {
  return _then(_self.copyWith(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as SeedBackupSteps,seed: freezed == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as List<String>?,rootXprv: freezed == rootXprv ? _self.rootXprv : rootXprv // ignore: cast_nullable_to_non_nullable
as String?,fingerPrint: freezed == fingerPrint ? _self.fingerPrint : fingerPrint // ignore: cast_nullable_to_non_nullable
as String?,quizSeedCompleted: null == quizSeedCompleted ? _self.quizSeedCompleted : quizSeedCompleted // ignore: cast_nullable_to_non_nullable
as int,quizSeedAnswer: null == quizSeedAnswer ? _self.quizSeedAnswer : quizSeedAnswer // ignore: cast_nullable_to_non_nullable
as String,quizSeedAnswerIdx: null == quizSeedAnswerIdx ? _self.quizSeedAnswerIdx : quizSeedAnswerIdx // ignore: cast_nullable_to_non_nullable
as int,quizSeedList: null == quizSeedList ? _self.quizSeedList : quizSeedList // ignore: cast_nullable_to_non_nullable
as List<String>,quizSeedCompletedAnswers: null == quizSeedCompletedAnswers ? _self.quizSeedCompletedAnswers : quizSeedCompletedAnswers // ignore: cast_nullable_to_non_nullable
as List<String>,quizSeedError: null == quizSeedError ? _self.quizSeedError : quizSeedError // ignore: cast_nullable_to_non_nullable
as String,errMasterKeyUpdate: null == errMasterKeyUpdate ? _self.errMasterKeyUpdate : errMasterKeyUpdate // ignore: cast_nullable_to_non_nullable
as String,backupLater: null == backupLater ? _self.backupLater : backupLater // ignore: cast_nullable_to_non_nullable
as bool,backupComplete: null == backupComplete ? _self.backupComplete : backupComplete // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SeedBackupState].
extension SeedBackupStatePatterns on SeedBackupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeedBackupState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeedBackupState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeedBackupState value)  $default,){
final _that = this;
switch (_that) {
case _SeedBackupState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeedBackupState value)?  $default,){
final _that = this;
switch (_that) {
case _SeedBackupState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SeedBackupSteps currentStep,  List<String>? seed,  String? rootXprv,  String? fingerPrint,  int quizSeedCompleted,  String quizSeedAnswer,  int quizSeedAnswerIdx,  List<String> quizSeedList,  List<String> quizSeedCompletedAnswers,  String quizSeedError,  String errMasterKeyUpdate,  bool backupLater,  bool backupComplete)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeedBackupState() when $default != null:
return $default(_that.currentStep,_that.seed,_that.rootXprv,_that.fingerPrint,_that.quizSeedCompleted,_that.quizSeedAnswer,_that.quizSeedAnswerIdx,_that.quizSeedList,_that.quizSeedCompletedAnswers,_that.quizSeedError,_that.errMasterKeyUpdate,_that.backupLater,_that.backupComplete);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SeedBackupSteps currentStep,  List<String>? seed,  String? rootXprv,  String? fingerPrint,  int quizSeedCompleted,  String quizSeedAnswer,  int quizSeedAnswerIdx,  List<String> quizSeedList,  List<String> quizSeedCompletedAnswers,  String quizSeedError,  String errMasterKeyUpdate,  bool backupLater,  bool backupComplete)  $default,) {final _that = this;
switch (_that) {
case _SeedBackupState():
return $default(_that.currentStep,_that.seed,_that.rootXprv,_that.fingerPrint,_that.quizSeedCompleted,_that.quizSeedAnswer,_that.quizSeedAnswerIdx,_that.quizSeedList,_that.quizSeedCompletedAnswers,_that.quizSeedError,_that.errMasterKeyUpdate,_that.backupLater,_that.backupComplete);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SeedBackupSteps currentStep,  List<String>? seed,  String? rootXprv,  String? fingerPrint,  int quizSeedCompleted,  String quizSeedAnswer,  int quizSeedAnswerIdx,  List<String> quizSeedList,  List<String> quizSeedCompletedAnswers,  String quizSeedError,  String errMasterKeyUpdate,  bool backupLater,  bool backupComplete)?  $default,) {final _that = this;
switch (_that) {
case _SeedBackupState() when $default != null:
return $default(_that.currentStep,_that.seed,_that.rootXprv,_that.fingerPrint,_that.quizSeedCompleted,_that.quizSeedAnswer,_that.quizSeedAnswerIdx,_that.quizSeedList,_that.quizSeedCompletedAnswers,_that.quizSeedError,_that.errMasterKeyUpdate,_that.backupLater,_that.backupComplete);case _:
  return null;

}
}

}

/// @nodoc


class _SeedBackupState extends SeedBackupState {
  const _SeedBackupState({this.currentStep = SeedBackupSteps.warning, final  List<String>? seed, this.rootXprv, this.fingerPrint, this.quizSeedCompleted = 0, this.quizSeedAnswer = '', this.quizSeedAnswerIdx = -1, final  List<String> quizSeedList = const [], final  List<String> quizSeedCompletedAnswers = const [], this.quizSeedError = '', this.errMasterKeyUpdate = '', this.backupLater = false, this.backupComplete = false}): _seed = seed,_quizSeedList = quizSeedList,_quizSeedCompletedAnswers = quizSeedCompletedAnswers,super._();
  

@override@JsonKey() final  SeedBackupSteps currentStep;
 final  List<String>? _seed;
@override List<String>? get seed {
  final value = _seed;
  if (value == null) return null;
  if (_seed is EqualUnmodifiableListView) return _seed;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? rootXprv;
@override final  String? fingerPrint;
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
@override@JsonKey() final  String errMasterKeyUpdate;
@override@JsonKey() final  bool backupLater;
@override@JsonKey() final  bool backupComplete;

/// Create a copy of SeedBackupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeedBackupStateCopyWith<_SeedBackupState> get copyWith => __$SeedBackupStateCopyWithImpl<_SeedBackupState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeedBackupState&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&const DeepCollectionEquality().equals(other._seed, _seed)&&(identical(other.rootXprv, rootXprv) || other.rootXprv == rootXprv)&&(identical(other.fingerPrint, fingerPrint) || other.fingerPrint == fingerPrint)&&(identical(other.quizSeedCompleted, quizSeedCompleted) || other.quizSeedCompleted == quizSeedCompleted)&&(identical(other.quizSeedAnswer, quizSeedAnswer) || other.quizSeedAnswer == quizSeedAnswer)&&(identical(other.quizSeedAnswerIdx, quizSeedAnswerIdx) || other.quizSeedAnswerIdx == quizSeedAnswerIdx)&&const DeepCollectionEquality().equals(other._quizSeedList, _quizSeedList)&&const DeepCollectionEquality().equals(other._quizSeedCompletedAnswers, _quizSeedCompletedAnswers)&&(identical(other.quizSeedError, quizSeedError) || other.quizSeedError == quizSeedError)&&(identical(other.errMasterKeyUpdate, errMasterKeyUpdate) || other.errMasterKeyUpdate == errMasterKeyUpdate)&&(identical(other.backupLater, backupLater) || other.backupLater == backupLater)&&(identical(other.backupComplete, backupComplete) || other.backupComplete == backupComplete));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,const DeepCollectionEquality().hash(_seed),rootXprv,fingerPrint,quizSeedCompleted,quizSeedAnswer,quizSeedAnswerIdx,const DeepCollectionEquality().hash(_quizSeedList),const DeepCollectionEquality().hash(_quizSeedCompletedAnswers),quizSeedError,errMasterKeyUpdate,backupLater,backupComplete);

@override
String toString() {
  return 'SeedBackupState(currentStep: $currentStep, seed: $seed, rootXprv: $rootXprv, fingerPrint: $fingerPrint, quizSeedCompleted: $quizSeedCompleted, quizSeedAnswer: $quizSeedAnswer, quizSeedAnswerIdx: $quizSeedAnswerIdx, quizSeedList: $quizSeedList, quizSeedCompletedAnswers: $quizSeedCompletedAnswers, quizSeedError: $quizSeedError, errMasterKeyUpdate: $errMasterKeyUpdate, backupLater: $backupLater, backupComplete: $backupComplete)';
}


}

/// @nodoc
abstract mixin class _$SeedBackupStateCopyWith<$Res> implements $SeedBackupStateCopyWith<$Res> {
  factory _$SeedBackupStateCopyWith(_SeedBackupState value, $Res Function(_SeedBackupState) _then) = __$SeedBackupStateCopyWithImpl;
@override @useResult
$Res call({
 SeedBackupSteps currentStep, List<String>? seed, String? rootXprv, String? fingerPrint, int quizSeedCompleted, String quizSeedAnswer, int quizSeedAnswerIdx, List<String> quizSeedList, List<String> quizSeedCompletedAnswers, String quizSeedError, String errMasterKeyUpdate, bool backupLater, bool backupComplete
});




}
/// @nodoc
class __$SeedBackupStateCopyWithImpl<$Res>
    implements _$SeedBackupStateCopyWith<$Res> {
  __$SeedBackupStateCopyWithImpl(this._self, this._then);

  final _SeedBackupState _self;
  final $Res Function(_SeedBackupState) _then;

/// Create a copy of SeedBackupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? seed = freezed,Object? rootXprv = freezed,Object? fingerPrint = freezed,Object? quizSeedCompleted = null,Object? quizSeedAnswer = null,Object? quizSeedAnswerIdx = null,Object? quizSeedList = null,Object? quizSeedCompletedAnswers = null,Object? quizSeedError = null,Object? errMasterKeyUpdate = null,Object? backupLater = null,Object? backupComplete = null,}) {
  return _then(_SeedBackupState(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as SeedBackupSteps,seed: freezed == seed ? _self._seed : seed // ignore: cast_nullable_to_non_nullable
as List<String>?,rootXprv: freezed == rootXprv ? _self.rootXprv : rootXprv // ignore: cast_nullable_to_non_nullable
as String?,fingerPrint: freezed == fingerPrint ? _self.fingerPrint : fingerPrint // ignore: cast_nullable_to_non_nullable
as String?,quizSeedCompleted: null == quizSeedCompleted ? _self.quizSeedCompleted : quizSeedCompleted // ignore: cast_nullable_to_non_nullable
as int,quizSeedAnswer: null == quizSeedAnswer ? _self.quizSeedAnswer : quizSeedAnswer // ignore: cast_nullable_to_non_nullable
as String,quizSeedAnswerIdx: null == quizSeedAnswerIdx ? _self.quizSeedAnswerIdx : quizSeedAnswerIdx // ignore: cast_nullable_to_non_nullable
as int,quizSeedList: null == quizSeedList ? _self._quizSeedList : quizSeedList // ignore: cast_nullable_to_non_nullable
as List<String>,quizSeedCompletedAnswers: null == quizSeedCompletedAnswers ? _self._quizSeedCompletedAnswers : quizSeedCompletedAnswers // ignore: cast_nullable_to_non_nullable
as List<String>,quizSeedError: null == quizSeedError ? _self.quizSeedError : quizSeedError // ignore: cast_nullable_to_non_nullable
as String,errMasterKeyUpdate: null == errMasterKeyUpdate ? _self.errMasterKeyUpdate : errMasterKeyUpdate // ignore: cast_nullable_to_non_nullable
as String,backupLater: null == backupLater ? _self.backupLater : backupLater // ignore: cast_nullable_to_non_nullable
as bool,backupComplete: null == backupComplete ? _self.backupComplete : backupComplete // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
