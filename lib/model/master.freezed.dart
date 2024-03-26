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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MasterKey _$MasterKeyFromJson(Map<String, dynamic> json) {
  return _MasterKey.fromJson(json);
}

/// @nodoc
mixin _$MasterKey {
  String? get seed => throw _privateConstructorUsedError;
  String? get root => throw _privateConstructorUsedError;
  String? get fingerprint => throw _privateConstructorUsedError;
  String? get network => throw _privateConstructorUsedError;
  bool? get backedUp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
      {String? seed,
      String? root,
      String? fingerprint,
      String? network,
      bool? backedUp});
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
abstract class _$$MasterKeyImplCopyWith<$Res>
    implements $MasterKeyCopyWith<$Res> {
  factory _$$MasterKeyImplCopyWith(
          _$MasterKeyImpl value, $Res Function(_$MasterKeyImpl) then) =
      __$$MasterKeyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? seed,
      String? root,
      String? fingerprint,
      String? network,
      bool? backedUp});
}

/// @nodoc
class __$$MasterKeyImplCopyWithImpl<$Res>
    extends _$MasterKeyCopyWithImpl<$Res, _$MasterKeyImpl>
    implements _$$MasterKeyImplCopyWith<$Res> {
  __$$MasterKeyImplCopyWithImpl(
      _$MasterKeyImpl _value, $Res Function(_$MasterKeyImpl) _then)
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
    return _then(_$MasterKeyImpl(
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
@JsonSerializable()
class _$MasterKeyImpl implements _MasterKey {
  const _$MasterKeyImpl(
      {this.seed, this.root, this.fingerprint, this.network, this.backedUp});

  factory _$MasterKeyImpl.fromJson(Map<String, dynamic> json) =>
      _$$MasterKeyImplFromJson(json);

  @override
  final String? seed;
  @override
  final String? root;
  @override
  final String? fingerprint;
  @override
  final String? network;
  @override
  final bool? backedUp;

  @override
  String toString() {
    return 'MasterKey(seed: $seed, root: $root, fingerprint: $fingerprint, network: $network, backedUp: $backedUp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MasterKeyImpl &&
            (identical(other.seed, seed) || other.seed == seed) &&
            (identical(other.root, root) || other.root == root) &&
            (identical(other.fingerprint, fingerprint) ||
                other.fingerprint == fingerprint) &&
            (identical(other.network, network) || other.network == network) &&
            (identical(other.backedUp, backedUp) ||
                other.backedUp == backedUp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, seed, root, fingerprint, network, backedUp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MasterKeyImplCopyWith<_$MasterKeyImpl> get copyWith =>
      __$$MasterKeyImplCopyWithImpl<_$MasterKeyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MasterKeyImplToJson(
      this,
    );
  }
}

abstract class _MasterKey implements MasterKey {
  const factory _MasterKey(
      {final String? seed,
      final String? root,
      final String? fingerprint,
      final String? network,
      final bool? backedUp}) = _$MasterKeyImpl;

  factory _MasterKey.fromJson(Map<String, dynamic> json) =
      _$MasterKeyImpl.fromJson;

  @override
  String? get seed;
  @override
  String? get root;
  @override
  String? get fingerprint;
  @override
  String? get network;
  @override
  bool? get backedUp;
  @override
  @JsonKey(ignore: true)
  _$$MasterKeyImplCopyWith<_$MasterKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
