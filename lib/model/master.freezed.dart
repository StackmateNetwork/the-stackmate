// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'master.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MasterKey {
  @HiveField(0)
  String? get seed => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get root => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get fingerprint => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get network => throw _privateConstructorUsedError;
  @HiveField(6)
  bool? get backedUp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MasterKeyCopyWith<MasterKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasterKeyCopyWith<$Res> {
  factory $MasterKeyCopyWith(MasterKey value, $Res Function(MasterKey) then) =
      _$MasterKeyCopyWithImpl<$Res, MasterKey>;
  @useResult
  $Res call(
      {@HiveField(0) String? seed,
      @HiveField(2) String? root,
      @HiveField(3) String? fingerprint,
      @HiveField(4) String? network,
      @HiveField(6) bool? backedUp});
}

/// @nodoc
class _$MasterKeyCopyWithImpl<$Res, $Val extends MasterKey>
    implements $MasterKeyCopyWith<$Res> {
  _$MasterKeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seed = freezed,
    Object? root = freezed,
    Object? fingerprint = freezed,
    Object? network = freezed,
    Object? backedUp = freezed,
  }) {
    return _then(_value.copyWith(
      seed: freezed == seed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as String?,
      root: freezed == root
          ? _value.root
          : root // ignore: cast_nullable_to_non_nullable
              as String?,
      fingerprint: freezed == fingerprint
          ? _value.fingerprint
          : fingerprint // ignore: cast_nullable_to_non_nullable
              as String?,
      network: freezed == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String?,
      backedUp: freezed == backedUp
          ? _value.backedUp
          : backedUp // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MasterKeyCopyWith<$Res> implements $MasterKeyCopyWith<$Res> {
  factory _$$_MasterKeyCopyWith(
          _$_MasterKey value, $Res Function(_$_MasterKey) then) =
      __$$_MasterKeyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? seed,
      @HiveField(2) String? root,
      @HiveField(3) String? fingerprint,
      @HiveField(4) String? network,
      @HiveField(6) bool? backedUp});
}

/// @nodoc
class __$$_MasterKeyCopyWithImpl<$Res>
    extends _$MasterKeyCopyWithImpl<$Res, _$_MasterKey>
    implements _$$_MasterKeyCopyWith<$Res> {
  __$$_MasterKeyCopyWithImpl(
      _$_MasterKey _value, $Res Function(_$_MasterKey) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seed = freezed,
    Object? root = freezed,
    Object? fingerprint = freezed,
    Object? network = freezed,
    Object? backedUp = freezed,
  }) {
    return _then(_$_MasterKey(
      seed: freezed == seed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as String?,
      root: freezed == root
          ? _value.root
          : root // ignore: cast_nullable_to_non_nullable
              as String?,
      fingerprint: freezed == fingerprint
          ? _value.fingerprint
          : fingerprint // ignore: cast_nullable_to_non_nullable
              as String?,
      network: freezed == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String?,
      backedUp: freezed == backedUp
          ? _value.backedUp
          : backedUp // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 7, adapterName: 'MasterKeyClassAdapter')
class _$_MasterKey extends _MasterKey {
  const _$_MasterKey(
      {@HiveField(0) this.seed,
      @HiveField(2) this.root,
      @HiveField(3) this.fingerprint,
      @HiveField(4) this.network,
      @HiveField(6) this.backedUp})
      : super._();

  @override
  @HiveField(0)
  final String? seed;
  @override
  @HiveField(2)
  final String? root;
  @override
  @HiveField(3)
  final String? fingerprint;
  @override
  @HiveField(4)
  final String? network;
  @override
  @HiveField(6)
  final bool? backedUp;

  @override
  String toString() {
    return 'MasterKey(seed: $seed, root: $root, fingerprint: $fingerprint, network: $network, backedUp: $backedUp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MasterKey &&
            (identical(other.seed, seed) || other.seed == seed) &&
            (identical(other.root, root) || other.root == root) &&
            (identical(other.fingerprint, fingerprint) ||
                other.fingerprint == fingerprint) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.backedUp, backedUp) ||
                other.backedUp == backedUp));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, seed, root, fingerprint, network, backedUp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MasterKeyCopyWith<_$_MasterKey> get copyWith =>
      __$$_MasterKeyCopyWithImpl<_$_MasterKey>(this, _$identity);
}

abstract class _MasterKey extends MasterKey {
  const factory _MasterKey(
      {@HiveField(0) final String? seed,
      @HiveField(2) final String? root,
      @HiveField(3) final String? fingerprint,
      @HiveField(4) final String? network,
      @HiveField(6) final bool? backedUp}) = _$_MasterKey;
  const _MasterKey._() : super._();

  @override
  @HiveField(0)
  String? get seed;
  @override
  @HiveField(2)
  String? get root;
  @override
  @HiveField(3)
  String? get fingerprint;
  @override
  @HiveField(4)
  String? get network;
  @override
  @HiveField(6)
  bool? get backedUp;
  @override
  @JsonKey(ignore: true)
  _$$_MasterKeyCopyWith<_$_MasterKey> get copyWith =>
      throw _privateConstructorUsedError;
}
