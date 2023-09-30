// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Wallet _$WalletFromJson(Map<String, dynamic> json) {
  return _Wallet.fromJson(json);
}

/// @nodoc
mixin _$Wallet {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get uid => throw _privateConstructorUsedError;
  @HiveField(2)
  String get label => throw _privateConstructorUsedError;
  @HiveField(3)
  String get descriptor => throw _privateConstructorUsedError;
  @HiveField(4)
  String get policy => throw _privateConstructorUsedError;
  @HiveField(5)
  int get requiredPolicyElements => throw _privateConstructorUsedError;
  @HiveField(6)
  List<String> get policyElements => throw _privateConstructorUsedError;
  @HiveField(7)
  String get blockchain => throw _privateConstructorUsedError;
  @HiveField(8)
  List<Transaction> get transactions => throw _privateConstructorUsedError;
  @HiveField(9)
  int get balance => throw _privateConstructorUsedError;
  @HiveField(10)
  int get lastAddressIndex => throw _privateConstructorUsedError;
  @HiveField(11)
  String get walletType => throw _privateConstructorUsedError;
  @HiveField(12)
  String get passPhrase => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletCopyWith<Wallet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletCopyWith<$Res> {
  factory $WalletCopyWith(Wallet value, $Res Function(Wallet) then) =
      _$WalletCopyWithImpl<$Res, Wallet>;
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String uid,
      @HiveField(2) String label,
      @HiveField(3) String descriptor,
      @HiveField(4) String policy,
      @HiveField(5) int requiredPolicyElements,
      @HiveField(6) List<String> policyElements,
      @HiveField(7) String blockchain,
      @HiveField(8) List<Transaction> transactions,
      @HiveField(9) int balance,
      @HiveField(10) int lastAddressIndex,
      @HiveField(11) String walletType,
      @HiveField(12) String passPhrase});
}

/// @nodoc
class _$WalletCopyWithImpl<$Res, $Val extends Wallet>
    implements $WalletCopyWith<$Res> {
  _$WalletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = null,
    Object? label = null,
    Object? descriptor = null,
    Object? policy = null,
    Object? requiredPolicyElements = null,
    Object? policyElements = null,
    Object? blockchain = null,
    Object? transactions = null,
    Object? balance = null,
    Object? lastAddressIndex = null,
    Object? walletType = null,
    Object? passPhrase = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      descriptor: null == descriptor
          ? _value.descriptor
          : descriptor // ignore: cast_nullable_to_non_nullable
              as String,
      policy: null == policy
          ? _value.policy
          : policy // ignore: cast_nullable_to_non_nullable
              as String,
      requiredPolicyElements: null == requiredPolicyElements
          ? _value.requiredPolicyElements
          : requiredPolicyElements // ignore: cast_nullable_to_non_nullable
              as int,
      policyElements: null == policyElements
          ? _value.policyElements
          : policyElements // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blockchain: null == blockchain
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as String,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      lastAddressIndex: null == lastAddressIndex
          ? _value.lastAddressIndex
          : lastAddressIndex // ignore: cast_nullable_to_non_nullable
              as int,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
      passPhrase: null == passPhrase
          ? _value.passPhrase
          : passPhrase // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WalletCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$$_WalletCopyWith(_$_Wallet value, $Res Function(_$_Wallet) then) =
      __$$_WalletCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String uid,
      @HiveField(2) String label,
      @HiveField(3) String descriptor,
      @HiveField(4) String policy,
      @HiveField(5) int requiredPolicyElements,
      @HiveField(6) List<String> policyElements,
      @HiveField(7) String blockchain,
      @HiveField(8) List<Transaction> transactions,
      @HiveField(9) int balance,
      @HiveField(10) int lastAddressIndex,
      @HiveField(11) String walletType,
      @HiveField(12) String passPhrase});
}

/// @nodoc
class __$$_WalletCopyWithImpl<$Res>
    extends _$WalletCopyWithImpl<$Res, _$_Wallet>
    implements _$$_WalletCopyWith<$Res> {
  __$$_WalletCopyWithImpl(_$_Wallet _value, $Res Function(_$_Wallet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = null,
    Object? label = null,
    Object? descriptor = null,
    Object? policy = null,
    Object? requiredPolicyElements = null,
    Object? policyElements = null,
    Object? blockchain = null,
    Object? transactions = null,
    Object? balance = null,
    Object? lastAddressIndex = null,
    Object? walletType = null,
    Object? passPhrase = null,
  }) {
    return _then(_$_Wallet(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      descriptor: null == descriptor
          ? _value.descriptor
          : descriptor // ignore: cast_nullable_to_non_nullable
              as String,
      policy: null == policy
          ? _value.policy
          : policy // ignore: cast_nullable_to_non_nullable
              as String,
      requiredPolicyElements: null == requiredPolicyElements
          ? _value.requiredPolicyElements
          : requiredPolicyElements // ignore: cast_nullable_to_non_nullable
              as int,
      policyElements: null == policyElements
          ? _value._policyElements
          : policyElements // ignore: cast_nullable_to_non_nullable
              as List<String>,
      blockchain: null == blockchain
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as String,
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as int,
      lastAddressIndex: null == lastAddressIndex
          ? _value.lastAddressIndex
          : lastAddressIndex // ignore: cast_nullable_to_non_nullable
              as int,
      walletType: null == walletType
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
      passPhrase: null == passPhrase
          ? _value.passPhrase
          : passPhrase // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'WalletClassAdapter')
class _$_Wallet extends _Wallet {
  const _$_Wallet(
      {@HiveField(0) this.id,
      @HiveField(1) required this.uid,
      @HiveField(2) required this.label,
      @HiveField(3) required this.descriptor,
      @HiveField(4) required this.policy,
      @HiveField(5) required this.requiredPolicyElements,
      @HiveField(6) required final List<String> policyElements,
      @HiveField(7) required this.blockchain,
      @HiveField(8) required final List<Transaction> transactions,
      @HiveField(9) required this.balance,
      @HiveField(10) required this.lastAddressIndex,
      @HiveField(11) required this.walletType,
      @HiveField(12) required this.passPhrase})
      : _policyElements = policyElements,
        _transactions = transactions,
        super._();

  factory _$_Wallet.fromJson(Map<String, dynamic> json) =>
      _$$_WalletFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final String uid;
  @override
  @HiveField(2)
  final String label;
  @override
  @HiveField(3)
  final String descriptor;
  @override
  @HiveField(4)
  final String policy;
  @override
  @HiveField(5)
  final int requiredPolicyElements;
  final List<String> _policyElements;
  @override
  @HiveField(6)
  List<String> get policyElements {
    if (_policyElements is EqualUnmodifiableListView) return _policyElements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_policyElements);
  }

  @override
  @HiveField(7)
  final String blockchain;
  final List<Transaction> _transactions;
  @override
  @HiveField(8)
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  @HiveField(9)
  final int balance;
  @override
  @HiveField(10)
  final int lastAddressIndex;
  @override
  @HiveField(11)
  final String walletType;
  @override
  @HiveField(12)
  final String passPhrase;

  @override
  String toString() {
    return 'Wallet(id: $id, uid: $uid, label: $label, descriptor: $descriptor, policy: $policy, requiredPolicyElements: $requiredPolicyElements, policyElements: $policyElements, blockchain: $blockchain, transactions: $transactions, balance: $balance, lastAddressIndex: $lastAddressIndex, walletType: $walletType, passPhrase: $passPhrase)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Wallet &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.descriptor, descriptor) ||
                other.descriptor == descriptor) &&
            (identical(other.policy, policy) || other.policy == policy) &&
            (identical(other.requiredPolicyElements, requiredPolicyElements) ||
                other.requiredPolicyElements == requiredPolicyElements) &&
            const DeepCollectionEquality()
                .equals(other._policyElements, _policyElements) &&
            (identical(other.blockchain, blockchain) ||
                other.blockchain == blockchain) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.lastAddressIndex, lastAddressIndex) ||
                other.lastAddressIndex == lastAddressIndex) &&
            (identical(other.walletType, walletType) ||
                other.walletType == walletType) &&
            (identical(other.passPhrase, passPhrase) ||
                other.passPhrase == passPhrase));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uid,
      label,
      descriptor,
      policy,
      requiredPolicyElements,
      const DeepCollectionEquality().hash(_policyElements),
      blockchain,
      const DeepCollectionEquality().hash(_transactions),
      balance,
      lastAddressIndex,
      walletType,
      passPhrase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WalletCopyWith<_$_Wallet> get copyWith =>
      __$$_WalletCopyWithImpl<_$_Wallet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletToJson(
      this,
    );
  }
}

abstract class _Wallet extends Wallet {
  const factory _Wallet(
      {@HiveField(0) final int? id,
      @HiveField(1) required final String uid,
      @HiveField(2) required final String label,
      @HiveField(3) required final String descriptor,
      @HiveField(4) required final String policy,
      @HiveField(5) required final int requiredPolicyElements,
      @HiveField(6) required final List<String> policyElements,
      @HiveField(7) required final String blockchain,
      @HiveField(8) required final List<Transaction> transactions,
      @HiveField(9) required final int balance,
      @HiveField(10) required final int lastAddressIndex,
      @HiveField(11) required final String walletType,
      @HiveField(12) required final String passPhrase}) = _$_Wallet;
  const _Wallet._() : super._();

  factory _Wallet.fromJson(Map<String, dynamic> json) = _$_Wallet.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  String get uid;
  @override
  @HiveField(2)
  String get label;
  @override
  @HiveField(3)
  String get descriptor;
  @override
  @HiveField(4)
  String get policy;
  @override
  @HiveField(5)
  int get requiredPolicyElements;
  @override
  @HiveField(6)
  List<String> get policyElements;
  @override
  @HiveField(7)
  String get blockchain;
  @override
  @HiveField(8)
  List<Transaction> get transactions;
  @override
  @HiveField(9)
  int get balance;
  @override
  @HiveField(10)
  int get lastAddressIndex;
  @override
  @HiveField(11)
  String get walletType;
  @override
  @HiveField(12)
  String get passPhrase;
  @override
  @JsonKey(ignore: true)
  _$$_WalletCopyWith<_$_Wallet> get copyWith =>
      throw _privateConstructorUsedError;
}
