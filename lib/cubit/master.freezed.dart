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
mixin _$MasterKeyState {
  MasterKey? get key => throw _privateConstructorUsedError;
  RecoveredKey? get rkey => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String? get network => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MasterKeyStateCopyWith<MasterKeyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasterKeyStateCopyWith<$Res> {
  factory $MasterKeyStateCopyWith(
          MasterKeyState value, $Res Function(MasterKeyState) then) =
      _$MasterKeyStateCopyWithImpl<$Res, MasterKeyState>;
  @useResult
  $Res call(
      {MasterKey? key, RecoveredKey? rkey, String? error, String? network});

  $MasterKeyCopyWith<$Res>? get key;
  $RecoveredKeyCopyWith<$Res>? get rkey;
}

/// @nodoc
class _$MasterKeyStateCopyWithImpl<$Res, $Val extends MasterKeyState>
    implements $MasterKeyStateCopyWith<$Res> {
  _$MasterKeyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? rkey = freezed,
    Object? error = freezed,
    Object? network = freezed,
  }) {
    return _then(_value.copyWith(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as MasterKey?,
      rkey: freezed == rkey
          ? _value.rkey
          : rkey // ignore: cast_nullable_to_non_nullable
              as RecoveredKey?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      network: freezed == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MasterKeyCopyWith<$Res>? get key {
    if (_value.key == null) {
      return null;
    }

    return $MasterKeyCopyWith<$Res>(_value.key!, (value) {
      return _then(_value.copyWith(key: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RecoveredKeyCopyWith<$Res>? get rkey {
    if (_value.rkey == null) {
      return null;
    }

    return $RecoveredKeyCopyWith<$Res>(_value.rkey!, (value) {
      return _then(_value.copyWith(rkey: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MasterKeyStateCopyWith<$Res>
    implements $MasterKeyStateCopyWith<$Res> {
  factory _$$_MasterKeyStateCopyWith(
          _$_MasterKeyState value, $Res Function(_$_MasterKeyState) then) =
      __$$_MasterKeyStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MasterKey? key, RecoveredKey? rkey, String? error, String? network});

  @override
  $MasterKeyCopyWith<$Res>? get key;
  @override
  $RecoveredKeyCopyWith<$Res>? get rkey;
}

/// @nodoc
class __$$_MasterKeyStateCopyWithImpl<$Res>
    extends _$MasterKeyStateCopyWithImpl<$Res, _$_MasterKeyState>
    implements _$$_MasterKeyStateCopyWith<$Res> {
  __$$_MasterKeyStateCopyWithImpl(
      _$_MasterKeyState _value, $Res Function(_$_MasterKeyState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? rkey = freezed,
    Object? error = freezed,
    Object? network = freezed,
  }) {
    return _then(_$_MasterKeyState(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as MasterKey?,
      rkey: freezed == rkey
          ? _value.rkey
          : rkey // ignore: cast_nullable_to_non_nullable
              as RecoveredKey?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      network: freezed == network
          ? _value.network
          : network // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_MasterKeyState extends _MasterKeyState {
  const _$_MasterKeyState({this.key, this.rkey, this.error, this.network})
      : super._();

  @override
  final MasterKey? key;
  @override
  final RecoveredKey? rkey;
  @override
  final String? error;
  @override
  final String? network;

  @override
  String toString() {
    return 'MasterKeyState(key: $key, rkey: $rkey, error: $error, network: $network)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MasterKeyState &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.rkey, rkey) || other.rkey == rkey) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.network, network) || other.network == network));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, rkey, error, network);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MasterKeyStateCopyWith<_$_MasterKeyState> get copyWith =>
      __$$_MasterKeyStateCopyWithImpl<_$_MasterKeyState>(this, _$identity);
}

abstract class _MasterKeyState extends MasterKeyState {
  const factory _MasterKeyState(
      {final MasterKey? key,
      final RecoveredKey? rkey,
      final String? error,
      final String? network}) = _$_MasterKeyState;
  const _MasterKeyState._() : super._();

  @override
  MasterKey? get key;
  @override
  RecoveredKey? get rkey;
  @override
  String? get error;
  @override
  String? get network;
  @override
  @JsonKey(ignore: true)
  _$$_MasterKeyStateCopyWith<_$_MasterKeyState> get copyWith =>
      throw _privateConstructorUsedError;
}
