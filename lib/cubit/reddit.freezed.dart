// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reddit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RedditStateTearOff {
  const _$RedditStateTearOff();

  _RedditState call(
      {List<RedditPost> posts = const [],
      String error = '',
      bool loading = false}) {
    return _RedditState(
      posts: posts,
      error: error,
      loading: loading,
    );
  }
}

/// @nodoc
const $RedditState = _$RedditStateTearOff();

/// @nodoc
mixin _$RedditState {
  List<RedditPost> get posts => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RedditStateCopyWith<RedditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RedditStateCopyWith<$Res> {
  factory $RedditStateCopyWith(
          RedditState value, $Res Function(RedditState) then) =
      _$RedditStateCopyWithImpl<$Res>;
  $Res call({List<RedditPost> posts, String error, bool loading});
}

/// @nodoc
class _$RedditStateCopyWithImpl<$Res> implements $RedditStateCopyWith<$Res> {
  _$RedditStateCopyWithImpl(this._value, this._then);

  final RedditState _value;
  // ignore: unused_field
  final $Res Function(RedditState) _then;

  @override
  $Res call({
    Object? posts = freezed,
    Object? error = freezed,
    Object? loading = freezed,
  }) {
    return _then(_value.copyWith(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<RedditPost>,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$RedditStateCopyWith<$Res>
    implements $RedditStateCopyWith<$Res> {
  factory _$RedditStateCopyWith(
          _RedditState value, $Res Function(_RedditState) then) =
      __$RedditStateCopyWithImpl<$Res>;
  @override
  $Res call({List<RedditPost> posts, String error, bool loading});
}

/// @nodoc
class __$RedditStateCopyWithImpl<$Res> extends _$RedditStateCopyWithImpl<$Res>
    implements _$RedditStateCopyWith<$Res> {
  __$RedditStateCopyWithImpl(
      _RedditState _value, $Res Function(_RedditState) _then)
      : super(_value, (v) => _then(v as _RedditState));

  @override
  _RedditState get _value => super._value as _RedditState;

  @override
  $Res call({
    Object? posts = freezed,
    Object? error = freezed,
    Object? loading = freezed,
  }) {
    return _then(_RedditState(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<RedditPost>,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RedditState with DiagnosticableTreeMixin implements _RedditState {
  const _$_RedditState(
      {this.posts = const [], this.error = '', this.loading = false});

  @JsonKey(defaultValue: const [])
  @override
  final List<RedditPost> posts;
  @JsonKey(defaultValue: '')
  @override
  final String error;
  @JsonKey(defaultValue: false)
  @override
  final bool loading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RedditState(posts: $posts, error: $error, loading: $loading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RedditState'))
      ..add(DiagnosticsProperty('posts', posts))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('loading', loading));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RedditState &&
            (identical(other.posts, posts) ||
                const DeepCollectionEquality().equals(other.posts, posts)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality().equals(other.loading, loading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(posts) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(loading);

  @JsonKey(ignore: true)
  @override
  _$RedditStateCopyWith<_RedditState> get copyWith =>
      __$RedditStateCopyWithImpl<_RedditState>(this, _$identity);
}

abstract class _RedditState implements RedditState {
  const factory _RedditState(
      {List<RedditPost> posts, String error, bool loading}) = _$_RedditState;

  @override
  List<RedditPost> get posts => throw _privateConstructorUsedError;
  @override
  String get error => throw _privateConstructorUsedError;
  @override
  bool get loading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RedditStateCopyWith<_RedditState> get copyWith =>
      throw _privateConstructorUsedError;
}
