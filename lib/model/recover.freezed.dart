// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recover.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecoveredKey _$RecoveredKeyFromJson(Map<String, dynamic> json) {
  return _RecoveredKey.fromJson(json);
}

/// @nodoc
mixin _$RecoveredKey {
  String? get seed => throw _privateConstructorUsedError;
  String? get root => throw _privateConstructorUsedError;
  String? get fingerprint => throw _privateConstructorUsedError;
  String? get network => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecoveredKeyCopyWith<RecoveredKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecoveredKeyCopyWith<$Res> {
  factory $RecoveredKeyCopyWith(
          RecoveredKey value, $Res Function(RecoveredKey) then) =
      _$RecoveredKeyCopyWithImpl<$Res, RecoveredKey>;
  @useResult
  $Res call({String? seed, String? root, String? fingerprint, String? network});
}

/// @nodoc
class _$RecoveredKeyCopyWithImpl<$Res, $Val extends RecoveredKey>
    implements $RecoveredKeyCopyWith<$Res> {
  _$RecoveredKeyCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecoveredKeyImplCopyWith<$Res>
    implements $RecoveredKeyCopyWith<$Res> {
  factory _$$RecoveredKeyImplCopyWith(
          _$RecoveredKeyImpl value, $Res Function(_$RecoveredKeyImpl) then) =
      __$$RecoveredKeyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? seed, String? root, String? fingerprint, String? network});
}

/// @nodoc
class __$$RecoveredKeyImplCopyWithImpl<$Res>
    extends _$RecoveredKeyCopyWithImpl<$Res, _$RecoveredKeyImpl>
    implements _$$RecoveredKeyImplCopyWith<$Res> {
  __$$RecoveredKeyImplCopyWithImpl(
      _$RecoveredKeyImpl _value, $Res Function(_$RecoveredKeyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seed = freezed,
    Object? root = freezed,
    Object? fingerprint = freezed,
    Object? network = freezed,
  }) {
    return _then(_$RecoveredKeyImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecoveredKeyImpl implements _RecoveredKey {
  const _$RecoveredKeyImpl(
      {this.seed, this.root, this.fingerprint, this.network});

  factory _$RecoveredKeyImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecoveredKeyImplFromJson(json);

  @override
  final String? seed;
  @override
  final String? root;
  @override
  final String? fingerprint;
  @override
  final String? network;

  @override
  String toString() {
    return 'RecoveredKey(seed: $seed, root: $root, fingerprint: $fingerprint, network: $network)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecoveredKeyImpl &&
            (identical(other.seed, seed) || other.seed == seed) &&
            (identical(other.root, root) || other.root == root) &&
            (identical(other.fingerprint, fingerprint) ||
                other.fingerprint == fingerprint) &&
            (identical(other.network, network) || other.network == network));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, seed, root, fingerprint, network);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecoveredKeyImplCopyWith<_$RecoveredKeyImpl> get copyWith =>
      __$$RecoveredKeyImplCopyWithImpl<_$RecoveredKeyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecoveredKeyImplToJson(
      this,
    );
  }
}

abstract class _RecoveredKey implements RecoveredKey {
  const factory _RecoveredKey(
      {final String? seed,
      final String? root,
      final String? fingerprint,
      final String? network}) = _$RecoveredKeyImpl;

  factory _RecoveredKey.fromJson(Map<String, dynamic> json) =
      _$RecoveredKeyImpl.fromJson;

  @override
  String? get seed;
  @override
  String? get root;
  @override
  String? get fingerprint;
  @override
  String? get network;
  @override
  @JsonKey(ignore: true)
  _$$RecoveredKeyImplCopyWith<_$RecoveredKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
