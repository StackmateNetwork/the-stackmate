// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'network-server-identity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NetworkServerIdentity _$NetworkServerIdentityFromJson(
    Map<String, dynamic> json) {
  return _NetworkServerIdentity.fromJson(json);
}

/// @nodoc
mixin _$NetworkServerIdentity {
  @HiveField(0)
  String get hostname => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get pubkey => throw _privateConstructorUsedError;
  @HiveField(3)
  String get kind => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkServerIdentityCopyWith<NetworkServerIdentity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkServerIdentityCopyWith<$Res> {
  factory $NetworkServerIdentityCopyWith(NetworkServerIdentity value,
          $Res Function(NetworkServerIdentity) then) =
      _$NetworkServerIdentityCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String hostname,
      @HiveField(1) String name,
      @HiveField(2) String pubkey,
      @HiveField(3) String kind});
}

/// @nodoc
class _$NetworkServerIdentityCopyWithImpl<$Res>
    implements $NetworkServerIdentityCopyWith<$Res> {
  _$NetworkServerIdentityCopyWithImpl(this._value, this._then);

  final NetworkServerIdentity _value;
  // ignore: unused_field
  final $Res Function(NetworkServerIdentity) _then;

  @override
  $Res call({
    Object? hostname = freezed,
    Object? name = freezed,
    Object? pubkey = freezed,
    Object? kind = freezed,
  }) {
    return _then(_value.copyWith(
      hostname: hostname == freezed
          ? _value.hostname
          : hostname // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pubkey: pubkey == freezed
          ? _value.pubkey
          : pubkey // ignore: cast_nullable_to_non_nullable
              as String,
      kind: kind == freezed
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_NetworkServerIdentityCopyWith<$Res>
    implements $NetworkServerIdentityCopyWith<$Res> {
  factory _$$_NetworkServerIdentityCopyWith(_$_NetworkServerIdentity value,
          $Res Function(_$_NetworkServerIdentity) then) =
      __$$_NetworkServerIdentityCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String hostname,
      @HiveField(1) String name,
      @HiveField(2) String pubkey,
      @HiveField(3) String kind});
}

/// @nodoc
class __$$_NetworkServerIdentityCopyWithImpl<$Res>
    extends _$NetworkServerIdentityCopyWithImpl<$Res>
    implements _$$_NetworkServerIdentityCopyWith<$Res> {
  __$$_NetworkServerIdentityCopyWithImpl(_$_NetworkServerIdentity _value,
      $Res Function(_$_NetworkServerIdentity) _then)
      : super(_value, (v) => _then(v as _$_NetworkServerIdentity));

  @override
  _$_NetworkServerIdentity get _value =>
      super._value as _$_NetworkServerIdentity;

  @override
  $Res call({
    Object? hostname = freezed,
    Object? name = freezed,
    Object? pubkey = freezed,
    Object? kind = freezed,
  }) {
    return _then(_$_NetworkServerIdentity(
      hostname: hostname == freezed
          ? _value.hostname
          : hostname // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      pubkey: pubkey == freezed
          ? _value.pubkey
          : pubkey // ignore: cast_nullable_to_non_nullable
              as String,
      kind: kind == freezed
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 11, adapterName: 'NetworkServerIdentityClassAdapter')
class _$_NetworkServerIdentity extends _NetworkServerIdentity {
  const _$_NetworkServerIdentity(
      {@HiveField(0) required this.hostname,
      @HiveField(1) required this.name,
      @HiveField(2) required this.pubkey,
      @HiveField(3) required this.kind})
      : super._();

  factory _$_NetworkServerIdentity.fromJson(Map<String, dynamic> json) =>
      _$$_NetworkServerIdentityFromJson(json);

  @override
  @HiveField(0)
  final String hostname;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String pubkey;
  @override
  @HiveField(3)
  final String kind;

  @override
  String toString() {
    return 'NetworkServerIdentity(hostname: $hostname, name: $name, pubkey: $pubkey, kind: $kind)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkServerIdentity &&
            const DeepCollectionEquality().equals(other.hostname, hostname) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.pubkey, pubkey) &&
            const DeepCollectionEquality().equals(other.kind, kind));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(hostname),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(pubkey),
      const DeepCollectionEquality().hash(kind));

  @JsonKey(ignore: true)
  @override
  _$$_NetworkServerIdentityCopyWith<_$_NetworkServerIdentity> get copyWith =>
      __$$_NetworkServerIdentityCopyWithImpl<_$_NetworkServerIdentity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NetworkServerIdentityToJson(this);
  }
}

abstract class _NetworkServerIdentity extends NetworkServerIdentity {
  const factory _NetworkServerIdentity(
      {@HiveField(0) required final String hostname,
      @HiveField(1) required final String name,
      @HiveField(2) required final String pubkey,
      @HiveField(3) required final String kind}) = _$_NetworkServerIdentity;
  const _NetworkServerIdentity._() : super._();

  factory _NetworkServerIdentity.fromJson(Map<String, dynamic> json) =
      _$_NetworkServerIdentity.fromJson;

  @override
  @HiveField(0)
  String get hostname => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get pubkey => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  String get kind => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkServerIdentityCopyWith<_$_NetworkServerIdentity> get copyWith =>
      throw _privateConstructorUsedError;
}
