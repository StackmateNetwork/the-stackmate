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
abstract class _$$_BlockchainStateCopyWith<$Res>
    implements $BlockchainStateCopyWith<$Res> {
  factory _$$_BlockchainStateCopyWith(
          _$_BlockchainState value, $Res Function(_$_BlockchainState) then) =
      __$$_BlockchainStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Blockchain blockchain});
}

/// @nodoc
class __$$_BlockchainStateCopyWithImpl<$Res>
    extends _$BlockchainStateCopyWithImpl<$Res, _$_BlockchainState>
    implements _$$_BlockchainStateCopyWith<$Res> {
  __$$_BlockchainStateCopyWithImpl(
      _$_BlockchainState _value, $Res Function(_$_BlockchainState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockchain = null,
  }) {
    return _then(_$_BlockchainState(
      blockchain: null == blockchain
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as Blockchain,
    ));
  }
}

/// @nodoc

class _$_BlockchainState implements _BlockchainState {
  const _$_BlockchainState({this.blockchain = Blockchain.main});

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
            other is _$_BlockchainState &&
            (identical(other.blockchain, blockchain) ||
                other.blockchain == blockchain));
  }

  @override
  int get hashCode => Object.hash(runtimeType, blockchain);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BlockchainStateCopyWith<_$_BlockchainState> get copyWith =>
      __$$_BlockchainStateCopyWithImpl<_$_BlockchainState>(this, _$identity);
}

abstract class _BlockchainState implements BlockchainState {
  const factory _BlockchainState({final Blockchain blockchain}) =
      _$_BlockchainState;

  @override
  Blockchain get blockchain;
  @override
  @JsonKey(ignore: true)
  _$$_BlockchainStateCopyWith<_$_BlockchainState> get copyWith =>
      throw _privateConstructorUsedError;
}
