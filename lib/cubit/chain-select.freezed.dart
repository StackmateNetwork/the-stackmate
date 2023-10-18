// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chain-select.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$BlockchainStateCopyWithImpl<$Res, BlockchainState>;
  @useResult
  $Res call({Blockchain blockchain});
}

/// @nodoc
class _$BlockchainStateCopyWithImpl<$Res, $Val extends BlockchainState>
    implements $BlockchainStateCopyWith<$Res> {
  _$BlockchainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockchain = null,
  }) {
    return _then(_value.copyWith(
      blockchain: null == blockchain
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as Blockchain,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlockchainStateImplCopyWith<$Res>
    implements $BlockchainStateCopyWith<$Res> {
  factory _$$BlockchainStateImplCopyWith(_$BlockchainStateImpl value,
          $Res Function(_$BlockchainStateImpl) then) =
      __$$BlockchainStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Blockchain blockchain});
}

/// @nodoc
class __$$BlockchainStateImplCopyWithImpl<$Res>
    extends _$BlockchainStateCopyWithImpl<$Res, _$BlockchainStateImpl>
    implements _$$BlockchainStateImplCopyWith<$Res> {
  __$$BlockchainStateImplCopyWithImpl(
      _$BlockchainStateImpl _value, $Res Function(_$BlockchainStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockchain = null,
  }) {
    return _then(_$BlockchainStateImpl(
      blockchain: null == blockchain
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as Blockchain,
    ));
  }
}

/// @nodoc

class _$BlockchainStateImpl implements _BlockchainState {
  const _$BlockchainStateImpl({this.blockchain = Blockchain.main});

  @override
  @JsonKey()
  final Blockchain blockchain;

  @override
  String toString() {
    return 'BlockchainState(blockchain: $blockchain)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockchainStateImpl &&
            (identical(other.blockchain, blockchain) ||
                other.blockchain == blockchain));
  }

  @override
  int get hashCode => Object.hash(runtimeType, blockchain);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockchainStateImplCopyWith<_$BlockchainStateImpl> get copyWith =>
      __$$BlockchainStateImplCopyWithImpl<_$BlockchainStateImpl>(
          this, _$identity);
}

abstract class _BlockchainState implements BlockchainState {
  const factory _BlockchainState({final Blockchain blockchain}) =
      _$BlockchainStateImpl;

  @override
  Blockchain get blockchain;
  @override
  @JsonKey(ignore: true)
  _$$BlockchainStateImplCopyWith<_$BlockchainStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
