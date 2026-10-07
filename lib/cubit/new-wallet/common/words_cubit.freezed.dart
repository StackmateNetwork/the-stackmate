// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'words_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WordsState {

/**
     * 
     * SENSITIVE
     * 
     */
 List<String>? get words;/**
     * 
     * SENSITIVE
     * 
     */
 String get err; bool get loading;
/// Create a copy of WordsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WordsStateCopyWith<WordsState> get copyWith => _$WordsStateCopyWithImpl<WordsState>(this as WordsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordsState&&const DeepCollectionEquality().equals(other.words, words)&&(identical(other.err, err) || other.err == err)&&(identical(other.loading, loading) || other.loading == loading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(words),err,loading);

@override
String toString() {
  return 'WordsState(words: $words, err: $err, loading: $loading)';
}


}

/// @nodoc
abstract mixin class $WordsStateCopyWith<$Res>  {
  factory $WordsStateCopyWith(WordsState value, $Res Function(WordsState) _then) = _$WordsStateCopyWithImpl;
@useResult
$Res call({
 List<String>? words, String err, bool loading
});




}
/// @nodoc
class _$WordsStateCopyWithImpl<$Res>
    implements $WordsStateCopyWith<$Res> {
  _$WordsStateCopyWithImpl(this._self, this._then);

  final WordsState _self;
  final $Res Function(WordsState) _then;

/// Create a copy of WordsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? words = freezed,Object? err = null,Object? loading = null,}) {
  return _then(_self.copyWith(
words: freezed == words ? _self.words : words // ignore: cast_nullable_to_non_nullable
as List<String>?,err: null == err ? _self.err : err // ignore: cast_nullable_to_non_nullable
as String,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [WordsState].
extension WordsStatePatterns on WordsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WordsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WordsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WordsState value)  $default,){
final _that = this;
switch (_that) {
case _WordsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WordsState value)?  $default,){
final _that = this;
switch (_that) {
case _WordsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String>? words,  String err,  bool loading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WordsState() when $default != null:
return $default(_that.words,_that.err,_that.loading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String>? words,  String err,  bool loading)  $default,) {final _that = this;
switch (_that) {
case _WordsState():
return $default(_that.words,_that.err,_that.loading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String>? words,  String err,  bool loading)?  $default,) {final _that = this;
switch (_that) {
case _WordsState() when $default != null:
return $default(_that.words,_that.err,_that.loading);case _:
  return null;

}
}

}

/// @nodoc


class _WordsState extends WordsState {
  const _WordsState({final  List<String>? words, this.err = '', this.loading = false}): _words = words,super._();
  

/**
     * 
     * SENSITIVE
     * 
     */
 final  List<String>? _words;
/**
     * 
     * SENSITIVE
     * 
     */
@override List<String>? get words {
  final value = _words;
  if (value == null) return null;
  if (_words is EqualUnmodifiableListView) return _words;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/**
     * 
     * SENSITIVE
     * 
     */
@override@JsonKey() final  String err;
@override@JsonKey() final  bool loading;

/// Create a copy of WordsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WordsStateCopyWith<_WordsState> get copyWith => __$WordsStateCopyWithImpl<_WordsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WordsState&&const DeepCollectionEquality().equals(other._words, _words)&&(identical(other.err, err) || other.err == err)&&(identical(other.loading, loading) || other.loading == loading));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_words),err,loading);

@override
String toString() {
  return 'WordsState(words: $words, err: $err, loading: $loading)';
}


}

/// @nodoc
abstract mixin class _$WordsStateCopyWith<$Res> implements $WordsStateCopyWith<$Res> {
  factory _$WordsStateCopyWith(_WordsState value, $Res Function(_WordsState) _then) = __$WordsStateCopyWithImpl;
@override @useResult
$Res call({
 List<String>? words, String err, bool loading
});




}
/// @nodoc
class __$WordsStateCopyWithImpl<$Res>
    implements _$WordsStateCopyWith<$Res> {
  __$WordsStateCopyWithImpl(this._self, this._then);

  final _WordsState _self;
  final $Res Function(_WordsState) _then;

/// Create a copy of WordsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? words = freezed,Object? err = null,Object? loading = null,}) {
  return _then(_WordsState(
words: freezed == words ? _self._words : words // ignore: cast_nullable_to_non_nullable
as List<String>?,err: null == err ? _self.err : err // ignore: cast_nullable_to_non_nullable
as String,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
