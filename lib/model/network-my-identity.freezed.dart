// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'network-my-identity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NetworkMyIdentity _$NetworkMyIdentityFromJson(Map<String, dynamic> json) {
  return _NetworkMyIdentity.fromJson(json);
}

/// @nodoc
mixin _$NetworkMyIdentity {
  @HiveField(0)
  String get hostname => throw _privateConstructorUsedError;
  @HiveField(1)
  String get username => throw _privateConstructorUsedError;
  @HiveField(2)
  String get pubkey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkMyIdentityCopyWith<NetworkMyIdentity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkMyIdentityCopyWith<$Res> {
  factory $NetworkMyIdentityCopyWith(
          NetworkMyIdentity value, $Res Function(NetworkMyIdentity) then) =
      _$NetworkMyIdentityCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String hostname,
      @HiveField(1) String username,
      @HiveField(2) String pubkey});
}

/// @nodoc
class _$NetworkMyIdentityCopyWithImpl<$Res>
    implements $NetworkMyIdentityCopyWith<$Res> {
  _$NetworkMyIdentityCopyWithImpl(this._value, this._then);

  final NetworkMyIdentity _value;
  // ignore: unused_field
  final $Res Function(NetworkMyIdentity) _then;

  @override
  $Res call({
    Object? hostname = freezed,
    Object? username = freezed,
    Object? pubkey = freezed,
  }) {
    return _then(_value.copyWith(
      hostname: hostname == freezed
          ? _value.hostname
          : hostname // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      pubkey: pubkey == freezed
          ? _value.pubkey
          : pubkey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_NetworkMyIdentityCopyWith<$Res>
    implements $NetworkMyIdentityCopyWith<$Res> {
  factory _$$_NetworkMyIdentityCopyWith(_$_NetworkMyIdentity value,
          $Res Function(_$_NetworkMyIdentity) then) =
      __$$_NetworkMyIdentityCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String hostname,
      @HiveField(1) String username,
      @HiveField(2) String pubkey});
}

/// @nodoc
class __$$_NetworkMyIdentityCopyWithImpl<$Res>
    extends _$NetworkMyIdentityCopyWithImpl<$Res>
    implements _$$_NetworkMyIdentityCopyWith<$Res> {
  __$$_NetworkMyIdentityCopyWithImpl(
      _$_NetworkMyIdentity _value, $Res Function(_$_NetworkMyIdentity) _then)
      : super(_value, (v) => _then(v as _$_NetworkMyIdentity));

  @override
  _$_NetworkMyIdentity get _value => super._value as _$_NetworkMyIdentity;

  @override
  $Res call({
    Object? hostname = freezed,
    Object? username = freezed,
    Object? pubkey = freezed,
  }) {
    return _then(_$_NetworkMyIdentity(
      hostname: hostname == freezed
          ? _value.hostname
          : hostname // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      pubkey: pubkey == freezed
          ? _value.pubkey
          : pubkey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 11, adapterName: 'NetworkMyIdentityClassAdapter')
class _$_NetworkMyIdentity extends _NetworkMyIdentity {
  const _$_NetworkMyIdentity(
      {@HiveField(0) required this.hostname,
      @HiveField(1) required this.username,
      @HiveField(2) required this.pubkey})
      : super._();

  factory _$_NetworkMyIdentity.fromJson(Map<String, dynamic> json) =>
      _$$_NetworkMyIdentityFromJson(json);

  @override
  @HiveField(0)
  final String hostname;
  @override
  @HiveField(1)
  final String username;
  @override
  @HiveField(2)
  final String pubkey;

  @override
  String toString() {
    return 'NetworkMyIdentity(hostname: $hostname, username: $username, pubkey: $pubkey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkMyIdentity &&
            const DeepCollectionEquality().equals(other.hostname, hostname) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.pubkey, pubkey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(hostname),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(pubkey));

  @JsonKey(ignore: true)
  @override
  _$$_NetworkMyIdentityCopyWith<_$_NetworkMyIdentity> get copyWith =>
      __$$_NetworkMyIdentityCopyWithImpl<_$_NetworkMyIdentity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NetworkMyIdentityToJson(this);
  }
}

abstract class _NetworkMyIdentity extends NetworkMyIdentity {
  const factory _NetworkMyIdentity(
      {@HiveField(0) required final String hostname,
      @HiveField(1) required final String username,
      @HiveField(2) required final String pubkey}) = _$_NetworkMyIdentity;
  const _NetworkMyIdentity._() : super._();

  factory _NetworkMyIdentity.fromJson(Map<String, dynamic> json) =
      _$_NetworkMyIdentity.fromJson;

  @override
  @HiveField(0)
  String get hostname => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get username => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get pubkey => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkMyIdentityCopyWith<_$_NetworkMyIdentity> get copyWith =>
      throw _privateConstructorUsedError;
}
