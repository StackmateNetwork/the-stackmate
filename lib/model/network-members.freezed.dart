// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'network-members.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NetworkMembers _$NetworkMembersFromJson(Map<String, dynamic> json) {
  return _NetworkMembers.fromJson(json);
}

/// @nodoc
mixin _$NetworkMembers {
  @HiveField(0)
  int get hostname => throw _privateConstructorUsedError;
  @HiveField(1)
  int get genesis => throw _privateConstructorUsedError;
  @HiveField(2)
  String get pubkey => throw _privateConstructorUsedError;
  @HiveField(3)
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkMembersCopyWith<NetworkMembers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkMembersCopyWith<$Res> {
  factory $NetworkMembersCopyWith(
          NetworkMembers value, $Res Function(NetworkMembers) then) =
      _$NetworkMembersCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) int hostname,
      @HiveField(1) int genesis,
      @HiveField(2) String pubkey,
      @HiveField(3) String username});
}

/// @nodoc
class _$NetworkMembersCopyWithImpl<$Res>
    implements $NetworkMembersCopyWith<$Res> {
  _$NetworkMembersCopyWithImpl(this._value, this._then);

  final NetworkMembers _value;
  // ignore: unused_field
  final $Res Function(NetworkMembers) _then;

  @override
  $Res call({
    Object? hostname = freezed,
    Object? genesis = freezed,
    Object? pubkey = freezed,
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      hostname: hostname == freezed
          ? _value.hostname
          : hostname // ignore: cast_nullable_to_non_nullable
              as int,
      genesis: genesis == freezed
          ? _value.genesis
          : genesis // ignore: cast_nullable_to_non_nullable
              as int,
      pubkey: pubkey == freezed
          ? _value.pubkey
          : pubkey // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_NetworkMembersCopyWith<$Res>
    implements $NetworkMembersCopyWith<$Res> {
  factory _$$_NetworkMembersCopyWith(
          _$_NetworkMembers value, $Res Function(_$_NetworkMembers) then) =
      __$$_NetworkMembersCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) int hostname,
      @HiveField(1) int genesis,
      @HiveField(2) String pubkey,
      @HiveField(3) String username});
}

/// @nodoc
class __$$_NetworkMembersCopyWithImpl<$Res>
    extends _$NetworkMembersCopyWithImpl<$Res>
    implements _$$_NetworkMembersCopyWith<$Res> {
  __$$_NetworkMembersCopyWithImpl(
      _$_NetworkMembers _value, $Res Function(_$_NetworkMembers) _then)
      : super(_value, (v) => _then(v as _$_NetworkMembers));

  @override
  _$_NetworkMembers get _value => super._value as _$_NetworkMembers;

  @override
  $Res call({
    Object? hostname = freezed,
    Object? genesis = freezed,
    Object? pubkey = freezed,
    Object? username = freezed,
  }) {
    return _then(_$_NetworkMembers(
      hostname: hostname == freezed
          ? _value.hostname
          : hostname // ignore: cast_nullable_to_non_nullable
              as int,
      genesis: genesis == freezed
          ? _value.genesis
          : genesis // ignore: cast_nullable_to_non_nullable
              as int,
      pubkey: pubkey == freezed
          ? _value.pubkey
          : pubkey // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 12, adapterName: 'NetworkMembersClassAdapter')
class _$_NetworkMembers extends _NetworkMembers {
  const _$_NetworkMembers(
      {@HiveField(0) required this.hostname,
      @HiveField(1) required this.genesis,
      @HiveField(2) required this.pubkey,
      @HiveField(3) required this.username})
      : super._();

  factory _$_NetworkMembers.fromJson(Map<String, dynamic> json) =>
      _$$_NetworkMembersFromJson(json);

  @override
  @HiveField(0)
  final int hostname;
  @override
  @HiveField(1)
  final int genesis;
  @override
  @HiveField(2)
  final String pubkey;
  @override
  @HiveField(3)
  final String username;

  @override
  String toString() {
    return 'NetworkMembers(hostname: $hostname, genesis: $genesis, pubkey: $pubkey, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkMembers &&
            const DeepCollectionEquality().equals(other.hostname, hostname) &&
            const DeepCollectionEquality().equals(other.genesis, genesis) &&
            const DeepCollectionEquality().equals(other.pubkey, pubkey) &&
            const DeepCollectionEquality().equals(other.username, username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(hostname),
      const DeepCollectionEquality().hash(genesis),
      const DeepCollectionEquality().hash(pubkey),
      const DeepCollectionEquality().hash(username));

  @JsonKey(ignore: true)
  @override
  _$$_NetworkMembersCopyWith<_$_NetworkMembers> get copyWith =>
      __$$_NetworkMembersCopyWithImpl<_$_NetworkMembers>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NetworkMembersToJson(this);
  }
}

abstract class _NetworkMembers extends NetworkMembers {
  const factory _NetworkMembers(
      {@HiveField(0) required final int hostname,
      @HiveField(1) required final int genesis,
      @HiveField(2) required final String pubkey,
      @HiveField(3) required final String username}) = _$_NetworkMembers;
  const _NetworkMembers._() : super._();

  factory _NetworkMembers.fromJson(Map<String, dynamic> json) =
      _$_NetworkMembers.fromJson;

  @override
  @HiveField(0)
  int get hostname => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  int get genesis => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get pubkey => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  String get username => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkMembersCopyWith<_$_NetworkMembers> get copyWith =>
      throw _privateConstructorUsedError;
}
