// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'network-chat-history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkChatHistory {
  @HiveField(0)
  String get counterParty => throw _privateConstructorUsedError;
  @HiveField(1)
  List<PlainPost> get posts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkChatHistoryCopyWith<NetworkChatHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkChatHistoryCopyWith<$Res> {
  factory $NetworkChatHistoryCopyWith(
          NetworkChatHistory value, $Res Function(NetworkChatHistory) then) =
      _$NetworkChatHistoryCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String counterParty, @HiveField(1) List<PlainPost> posts});
}

/// @nodoc
class _$NetworkChatHistoryCopyWithImpl<$Res>
    implements $NetworkChatHistoryCopyWith<$Res> {
  _$NetworkChatHistoryCopyWithImpl(this._value, this._then);

  final NetworkChatHistory _value;
  // ignore: unused_field
  final $Res Function(NetworkChatHistory) _then;

  @override
  $Res call({
    Object? counterParty = freezed,
    Object? posts = freezed,
  }) {
    return _then(_value.copyWith(
      counterParty: counterParty == freezed
          ? _value.counterParty
          : counterParty // ignore: cast_nullable_to_non_nullable
              as String,
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PlainPost>,
    ));
  }
}

/// @nodoc
abstract class _$$_NetworkChatHistoryCopyWith<$Res>
    implements $NetworkChatHistoryCopyWith<$Res> {
  factory _$$_NetworkChatHistoryCopyWith(_$_NetworkChatHistory value,
          $Res Function(_$_NetworkChatHistory) then) =
      __$$_NetworkChatHistoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String counterParty, @HiveField(1) List<PlainPost> posts});
}

/// @nodoc
class __$$_NetworkChatHistoryCopyWithImpl<$Res>
    extends _$NetworkChatHistoryCopyWithImpl<$Res>
    implements _$$_NetworkChatHistoryCopyWith<$Res> {
  __$$_NetworkChatHistoryCopyWithImpl(
      _$_NetworkChatHistory _value, $Res Function(_$_NetworkChatHistory) _then)
      : super(_value, (v) => _then(v as _$_NetworkChatHistory));

  @override
  _$_NetworkChatHistory get _value => super._value as _$_NetworkChatHistory;

  @override
  $Res call({
    Object? counterParty = freezed,
    Object? posts = freezed,
  }) {
    return _then(_$_NetworkChatHistory(
      counterParty: counterParty == freezed
          ? _value.counterParty
          : counterParty // ignore: cast_nullable_to_non_nullable
              as String,
      posts: posts == freezed
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PlainPost>,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 13, adapterName: 'NetworkChatHistoryClassAdapter')
class _$_NetworkChatHistory extends _NetworkChatHistory {
  const _$_NetworkChatHistory(
      {@HiveField(0) required this.counterParty,
      @HiveField(1) required final List<PlainPost> posts})
      : _posts = posts,
        super._();

  @override
  @HiveField(0)
  final String counterParty;
  final List<PlainPost> _posts;
  @override
  @HiveField(1)
  List<PlainPost> get posts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  String toString() {
    return 'NetworkChatHistory(counterParty: $counterParty, posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkChatHistory &&
            const DeepCollectionEquality()
                .equals(other.counterParty, counterParty) &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(counterParty),
      const DeepCollectionEquality().hash(_posts));

  @JsonKey(ignore: true)
  @override
  _$$_NetworkChatHistoryCopyWith<_$_NetworkChatHistory> get copyWith =>
      __$$_NetworkChatHistoryCopyWithImpl<_$_NetworkChatHistory>(
          this, _$identity);
}

abstract class _NetworkChatHistory extends NetworkChatHistory {
  const factory _NetworkChatHistory(
          {@HiveField(0) required final String counterParty,
          @HiveField(1) required final List<PlainPost> posts}) =
      _$_NetworkChatHistory;
  const _NetworkChatHistory._() : super._();

  @override
  @HiveField(0)
  String get counterParty => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  List<PlainPost> get posts => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkChatHistoryCopyWith<_$_NetworkChatHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
