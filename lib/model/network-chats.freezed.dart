// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'network-chats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkChats {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get pubkey => throw _privateConstructorUsedError;
  @HiveField(2)
  String get username => throw _privateConstructorUsedError;
  @HiveField(3)
  List<Map<String, dynamic>> get posts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkChatsCopyWith<NetworkChats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkChatsCopyWith<$Res> {
  factory $NetworkChatsCopyWith(
          NetworkChats value, $Res Function(NetworkChats) then) =
      _$NetworkChatsCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String pubkey,
      @HiveField(2) String username,
      @HiveField(3) List<Map<String, dynamic>> posts});
}

/// @nodoc
class _$NetworkChatsCopyWithImpl<$Res> implements $NetworkChatsCopyWith<$Res> {
  _$NetworkChatsCopyWithImpl(this._value, this._then);

  final NetworkChats _value;
  // ignore: unused_field
  final $Res Function(NetworkChats) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? pubkey = freezed,
    Object? username = freezed,
    Object? posts = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      pubkey: pubkey == freezed
          ? _value.pubkey
          : pubkey // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
abstract class _$$_NetworkChatsCopyWith<$Res>
    implements $NetworkChatsCopyWith<$Res> {
  factory _$$_NetworkChatsCopyWith(
          _$_NetworkChats value, $Res Function(_$_NetworkChats) then) =
      __$$_NetworkChatsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String pubkey,
      @HiveField(2) String username,
      @HiveField(3) List<Map<String, dynamic>> posts});
}

/// @nodoc
class __$$_NetworkChatsCopyWithImpl<$Res>
    extends _$NetworkChatsCopyWithImpl<$Res>
    implements _$$_NetworkChatsCopyWith<$Res> {
  __$$_NetworkChatsCopyWithImpl(
      _$_NetworkChats _value, $Res Function(_$_NetworkChats) _then)
      : super(_value, (v) => _then(v as _$_NetworkChats));

  @override
  _$_NetworkChats get _value => super._value as _$_NetworkChats;

  @override
  $Res call({
    Object? id = freezed,
    Object? pubkey = freezed,
    Object? username = freezed,
    Object? posts = freezed,
  }) {
    return _then(_$_NetworkChats(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      pubkey: pubkey == freezed
          ? _value.pubkey
          : pubkey // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      posts: posts == freezed
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 15, adapterName: 'NetworkChatsClassAdapter')
class _$_NetworkChats extends _NetworkChats {
  const _$_NetworkChats(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.pubkey,
      @HiveField(2) required this.username,
      @HiveField(3) required final List<Map<String, dynamic>> posts})
      : _posts = posts,
        super._();

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String pubkey;
  @override
  @HiveField(2)
  final String username;
  final List<Map<String, dynamic>> _posts;
  @override
  @HiveField(3)
  List<Map<String, dynamic>> get posts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  String toString() {
    return 'NetworkChats(id: $id, pubkey: $pubkey, username: $username, posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkChats &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.pubkey, pubkey) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(pubkey),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(_posts));

  @JsonKey(ignore: true)
  @override
  _$$_NetworkChatsCopyWith<_$_NetworkChats> get copyWith =>
      __$$_NetworkChatsCopyWithImpl<_$_NetworkChats>(this, _$identity);
}

abstract class _NetworkChats extends NetworkChats {
  const factory _NetworkChats(
          {@HiveField(0) required final int id,
          @HiveField(1) required final String pubkey,
          @HiveField(2) required final String username,
          @HiveField(3) required final List<Map<String, dynamic>> posts}) =
      _$_NetworkChats;
  const _NetworkChats._() : super._();

  @override
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get pubkey => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get username => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  List<Map<String, dynamic>> get posts => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkChatsCopyWith<_$_NetworkChats> get copyWith =>
      throw _privateConstructorUsedError;
}
