// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chain-select.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BlockchainStateTearOff {
  const _$BlockchainStateTearOff();

  _BlockchainState call({Blockchain blockchain = Blockchain.testNet}) {
    return _BlockchainState(
      blockchain: blockchain,
    );
  }
}

/// @nodoc
const $BlockchainState = _$BlockchainStateTearOff();

/// @nodoc
mixin _$BlockchainState {
  Blockchain get blockchain => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlockchainStateCopyWith<BlockchainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockchainStateCopyWith<$Res> {
  factory $BlockchainStateCopyWith(
          BlockchainState value, $Res Function(BlockchainState) then) =
      _$BlockchainStateCopyWithImpl<$Res>;
  $Res call({Blockchain blockchain});
}

/// @nodoc
class _$BlockchainStateCopyWithImpl<$Res>
    implements $BlockchainStateCopyWith<$Res> {
  _$BlockchainStateCopyWithImpl(this._value, this._then);

  final BlockchainState _value;
  // ignore: unused_field
  final $Res Function(BlockchainState) _then;

  @override
  $Res call({
    Object? blockchain = freezed,
  }) {
    return _then(_value.copyWith(
      blockchain: blockchain == freezed
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as Blockchain,
    ));
  }
}

/// @nodoc
abstract class _$BlockchainStateCopyWith<$Res>
    implements $BlockchainStateCopyWith<$Res> {
  factory _$BlockchainStateCopyWith(
          _BlockchainState value, $Res Function(_BlockchainState) then) =
      __$BlockchainStateCopyWithImpl<$Res>;
  @override
  $Res call({Blockchain blockchain});
}

/// @nodoc
class __$BlockchainStateCopyWithImpl<$Res>
    extends _$BlockchainStateCopyWithImpl<$Res>
    implements _$BlockchainStateCopyWith<$Res> {
  __$BlockchainStateCopyWithImpl(
      _BlockchainState _value, $Res Function(_BlockchainState) _then)
      : super(_value, (v) => _then(v as _BlockchainState));

  @override
  _BlockchainState get _value => super._value as _BlockchainState;

  @override
  $Res call({
    Object? blockchain = freezed,
  }) {
    return _then(_BlockchainState(
      blockchain: blockchain == freezed
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as Blockchain,
    ));
  }
}

/// @nodoc

class _$_BlockchainState implements _BlockchainState {
  const _$_BlockchainState({this.blockchain = Blockchain.testNet});

  @JsonKey(defaultValue: Blockchain.testNet)
  @override
  final Blockchain blockchain;

  @override
  String toString() {
    return 'BlockchainState(blockchain: $blockchain)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BlockchainState &&
            (identical(other.blockchain, blockchain) ||
                const DeepCollectionEquality()
                    .equals(other.blockchain, blockchain)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(blockchain);

  @JsonKey(ignore: true)
  @override
  _$BlockchainStateCopyWith<_BlockchainState> get copyWith =>
      __$BlockchainStateCopyWithImpl<_BlockchainState>(this, _$identity);
}

abstract class _BlockchainState implements BlockchainState {
  const factory _BlockchainState({Blockchain blockchain}) = _$_BlockchainState;

  @override
  Blockchain get blockchain => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BlockchainStateCopyWith<_BlockchainState> get copyWith =>
      throw _privateConstructorUsedError;
}
