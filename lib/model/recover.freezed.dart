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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_RecoveredKeyCopyWith<$Res>
    implements $RecoveredKeyCopyWith<$Res> {
  factory _$$_RecoveredKeyCopyWith(
          _$_RecoveredKey value, $Res Function(_$_RecoveredKey) then) =
      __$$_RecoveredKeyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? seed, String? root, String? fingerprint, String? network});
}

/// @nodoc
class __$$_RecoveredKeyCopyWithImpl<$Res>
    extends _$RecoveredKeyCopyWithImpl<$Res, _$_RecoveredKey>
    implements _$$_RecoveredKeyCopyWith<$Res> {
  __$$_RecoveredKeyCopyWithImpl(
      _$_RecoveredKey _value, $Res Function(_$_RecoveredKey) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seed = freezed,
    Object? root = freezed,
    Object? fingerprint = freezed,
    Object? network = freezed,
  }) {
    return _then(_$_RecoveredKey(
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
class _$_RecoveredKey implements _RecoveredKey {
  const _$_RecoveredKey({this.seed, this.root, this.fingerprint, this.network});

  factory _$_RecoveredKey.fromJson(Map<String, dynamic> json) =>
      _$$_RecoveredKeyFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecoveredKey &&
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
  _$$_RecoveredKeyCopyWith<_$_RecoveredKey> get copyWith =>
      __$$_RecoveredKeyCopyWithImpl<_$_RecoveredKey>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecoveredKeyToJson(
      this,
    );
  }
}

abstract class _RecoveredKey implements RecoveredKey {
  const factory _RecoveredKey(
      {final String? seed,
      final String? root,
      final String? fingerprint,
      final String? network}) = _$_RecoveredKey;

  factory _RecoveredKey.fromJson(Map<String, dynamic> json) =
      _$_RecoveredKey.fromJson;

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
  _$$_RecoveredKeyCopyWith<_$_RecoveredKey> get copyWith =>
      throw _privateConstructorUsedError;
}
