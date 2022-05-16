// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Wallet _$WalletFromJson(Map<String, dynamic> json) {
  return _Wallet.fromJson(json);
}

/// @nodoc
class _$WalletTearOff {
  const _$WalletTearOff();

  _Wallet call(
      {@HiveField(0) required String label,
      @HiveField(1) required String descriptor,
      @HiveField(2) required String policy,
      @HiveField(3) required int requiredPolicyElements,
      @HiveField(4) required List<String> policyElements,
      @HiveField(5) required String blockchain,
      @HiveField(6) List<Transaction>? transactions,
      @HiveField(7) int? id,
      @HiveField(8) required int balance,
      @HiveField(9) required int lastAddressIndex,
      @HiveField(10) required String walletType}) {
    return _Wallet(
      label: label,
      descriptor: descriptor,
      policy: policy,
      requiredPolicyElements: requiredPolicyElements,
      policyElements: policyElements,
      blockchain: blockchain,
      transactions: transactions,
      id: id,
      balance: balance,
      lastAddressIndex: lastAddressIndex,
      walletType: walletType,
    );
  }

  Wallet fromJson(Map<String, Object> json) {
    return Wallet.fromJson(json);
  }
}

/// @nodoc
const $Wallet = _$WalletTearOff();

/// @nodoc
mixin _$Wallet {
  @HiveField(0)
  String get label => throw _privateConstructorUsedError;
  @HiveField(1)
  String get descriptor => throw _privateConstructorUsedError;
  @HiveField(2)
  String get policy => throw _privateConstructorUsedError;
  @HiveField(3)
  int get requiredPolicyElements => throw _privateConstructorUsedError;
  @HiveField(4)
  List<String> get policyElements => throw _privateConstructorUsedError;
  @HiveField(5)
  String get blockchain => throw _privateConstructorUsedError;
  @HiveField(6)
  List<Transaction>? get transactions => throw _privateConstructorUsedError;
  @HiveField(7)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(8)
  int get balance => throw _privateConstructorUsedError;
  @HiveField(9)
  int get lastAddressIndex => throw _privateConstructorUsedError;
  @HiveField(10)
  String get walletType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletCopyWith<Wallet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletCopyWith<$Res> {
  factory $WalletCopyWith(Wallet value, $Res Function(Wallet) then) =
      _$WalletCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String label,
      @HiveField(1) String descriptor,
      @HiveField(2) String policy,
      @HiveField(3) int requiredPolicyElements,
      @HiveField(4) List<String> policyElements,
      @HiveField(5) String blockchain,
      @HiveField(6) List<Transaction>? transactions,
      @HiveField(7) int? id,
      @HiveField(8) int balance,
      @HiveField(9) int lastAddressIndex,
      @HiveField(10) String walletType});
}

/// @nodoc
class _$WalletCopyWithImpl<$Res> implements $WalletCopyWith<$Res> {
  _$WalletCopyWithImpl(this._value, this._then);

  final Wallet _value;
  // ignore: unused_field
  final $Res Function(Wallet) _then;

  @override
  $Res call({
    Object? label = freezed,
    Object? descriptor = freezed,
    Object? policy = freezed,
    Object? requiredPolicyElements = freezed,
    Object? policyElements = freezed,
    Object? blockchain = freezed,
    Object? transactions = freezed,
    Object? id = freezed,
    Object? balance = freezed,
    Object? lastAddressIndex = freezed,
    Object? walletType = freezed,
  }) {
    return _then(_value.copyWith(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      descriptor: descriptor == freezed
          ? _value.descriptor
          : descriptor // ignore: cast_nullable_to_non_nullable
              as String,
      policy: policy == freezed
          ? _value.policy
          : policy // ignore: cast_nullable_to_non_nullable
              as String,
      requiredPolicyElements: requiredPolicyElements == freezed
          ? _value.requiredPolicyElements
          : requiredPolicyElements // ignore: cast_nullable_to_non_nullable
              as int,
      policyElements: policyElements == freezed
          ? _value.policyElements
          : policyElements // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blockchain: blockchain == freezed
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as String,
      transactions: transactions == freezed
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      lastAddressIndex: lastAddressIndex == freezed
          ? _value.lastAddressIndex
          : lastAddressIndex // ignore: cast_nullable_to_non_nullable
              as int,
      walletType: walletType == freezed
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$WalletCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$WalletCopyWith(_Wallet value, $Res Function(_Wallet) then) =
      __$WalletCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String label,
      @HiveField(1) String descriptor,
      @HiveField(2) String policy,
      @HiveField(3) int requiredPolicyElements,
      @HiveField(4) List<String> policyElements,
      @HiveField(5) String blockchain,
      @HiveField(6) List<Transaction>? transactions,
      @HiveField(7) int? id,
      @HiveField(8) int balance,
      @HiveField(9) int lastAddressIndex,
      @HiveField(10) String walletType});
}

/// @nodoc
class __$WalletCopyWithImpl<$Res> extends _$WalletCopyWithImpl<$Res>
    implements _$WalletCopyWith<$Res> {
  __$WalletCopyWithImpl(_Wallet _value, $Res Function(_Wallet) _then)
      : super(_value, (v) => _then(v as _Wallet));

  @override
  _Wallet get _value => super._value as _Wallet;

  @override
  $Res call({
    Object? label = freezed,
    Object? descriptor = freezed,
    Object? policy = freezed,
    Object? requiredPolicyElements = freezed,
    Object? policyElements = freezed,
    Object? blockchain = freezed,
    Object? transactions = freezed,
    Object? id = freezed,
    Object? balance = freezed,
    Object? lastAddressIndex = freezed,
    Object? walletType = freezed,
  }) {
    return _then(_Wallet(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      descriptor: descriptor == freezed
          ? _value.descriptor
          : descriptor // ignore: cast_nullable_to_non_nullable
              as String,
      policy: policy == freezed
          ? _value.policy
          : policy // ignore: cast_nullable_to_non_nullable
              as String,
      requiredPolicyElements: requiredPolicyElements == freezed
          ? _value.requiredPolicyElements
          : requiredPolicyElements // ignore: cast_nullable_to_non_nullable
              as int,
      policyElements: policyElements == freezed
          ? _value.policyElements
          : policyElements // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blockchain: blockchain == freezed
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as String,
      transactions: transactions == freezed
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      lastAddressIndex: lastAddressIndex == freezed
          ? _value.lastAddressIndex
          : lastAddressIndex // ignore: cast_nullable_to_non_nullable
              as int,
      walletType: walletType == freezed
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'WalletClassAdapter')
class _$_Wallet extends _Wallet {
  const _$_Wallet(
      {@HiveField(0) required this.label,
      @HiveField(1) required this.descriptor,
      @HiveField(2) required this.policy,
      @HiveField(3) required this.requiredPolicyElements,
      @HiveField(4) required this.policyElements,
      @HiveField(5) required this.blockchain,
      @HiveField(6) this.transactions,
      @HiveField(7) this.id,
      @HiveField(8) required this.balance,
      @HiveField(9) required this.lastAddressIndex,
      @HiveField(10) required this.walletType})
      : super._();

  factory _$_Wallet.fromJson(Map<String, dynamic> json) =>
      _$$_WalletFromJson(json);

  @override
  @HiveField(0)
  final String label;
  @override
  @HiveField(1)
  final String descriptor;
  @override
  @HiveField(2)
  final String policy;
  @override
  @HiveField(3)
  final int requiredPolicyElements;
  @override
  @HiveField(4)
  final List<String> policyElements;
  @override
  @HiveField(5)
  final String blockchain;
  @override
  @HiveField(6)
  final List<Transaction>? transactions;
  @override
  @HiveField(7)
  final int? id;
  @override
  @HiveField(8)
  final int balance;
  @override
  @HiveField(9)
  final int lastAddressIndex;
  @override
  @HiveField(10)
  final String walletType;

  @override
  String toString() {
    return 'Wallet(label: $label, descriptor: $descriptor, policy: $policy, requiredPolicyElements: $requiredPolicyElements, policyElements: $policyElements, blockchain: $blockchain, transactions: $transactions, id: $id, balance: $balance, lastAddressIndex: $lastAddressIndex, walletType: $walletType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Wallet &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.descriptor, descriptor) ||
                const DeepCollectionEquality()
                    .equals(other.descriptor, descriptor)) &&
            (identical(other.policy, policy) ||
                const DeepCollectionEquality().equals(other.policy, policy)) &&
            (identical(other.requiredPolicyElements, requiredPolicyElements) ||
                const DeepCollectionEquality().equals(
                    other.requiredPolicyElements, requiredPolicyElements)) &&
            (identical(other.policyElements, policyElements) ||
                const DeepCollectionEquality()
                    .equals(other.policyElements, policyElements)) &&
            (identical(other.blockchain, blockchain) ||
                const DeepCollectionEquality()
                    .equals(other.blockchain, blockchain)) &&
            (identical(other.transactions, transactions) ||
                const DeepCollectionEquality()
                    .equals(other.transactions, transactions)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.balance, balance) ||
                const DeepCollectionEquality()
                    .equals(other.balance, balance)) &&
            (identical(other.lastAddressIndex, lastAddressIndex) ||
                const DeepCollectionEquality()
                    .equals(other.lastAddressIndex, lastAddressIndex)) &&
            (identical(other.walletType, walletType) ||
                const DeepCollectionEquality()
                    .equals(other.walletType, walletType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(descriptor) ^
      const DeepCollectionEquality().hash(policy) ^
      const DeepCollectionEquality().hash(requiredPolicyElements) ^
      const DeepCollectionEquality().hash(policyElements) ^
      const DeepCollectionEquality().hash(blockchain) ^
      const DeepCollectionEquality().hash(transactions) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(balance) ^
      const DeepCollectionEquality().hash(lastAddressIndex) ^
      const DeepCollectionEquality().hash(walletType);

  @JsonKey(ignore: true)
  @override
  _$WalletCopyWith<_Wallet> get copyWith =>
      __$WalletCopyWithImpl<_Wallet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletToJson(this);
  }
}

abstract class _Wallet extends Wallet {
  const factory _Wallet(
      {@HiveField(0) required String label,
      @HiveField(1) required String descriptor,
      @HiveField(2) required String policy,
      @HiveField(3) required int requiredPolicyElements,
      @HiveField(4) required List<String> policyElements,
      @HiveField(5) required String blockchain,
      @HiveField(6) List<Transaction>? transactions,
      @HiveField(7) int? id,
      @HiveField(8) required int balance,
      @HiveField(9) required int lastAddressIndex,
      @HiveField(10) required String walletType}) = _$_Wallet;
  const _Wallet._() : super._();

  factory _Wallet.fromJson(Map<String, dynamic> json) = _$_Wallet.fromJson;

  @override
  @HiveField(0)
  String get label => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get descriptor => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get policy => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  int get requiredPolicyElements => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  List<String> get policyElements => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  String get blockchain => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  List<Transaction>? get transactions => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  int? get id => throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  int get balance => throw _privateConstructorUsedError;
  @override
  @HiveField(9)
  int get lastAddressIndex => throw _privateConstructorUsedError;
  @override
  @HiveField(10)
  String get walletType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WalletCopyWith<_Wallet> get copyWith => throw _privateConstructorUsedError;
}
