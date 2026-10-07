// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Wallet {

@HiveField(0) int? get id;@HiveField(1) String get uid;@HiveField(2) String get label;@HiveField(3) String get descriptor;@HiveField(4) String get policy;@HiveField(5) int get requiredPolicyElements;@HiveField(6) List<String> get policyElements;@HiveField(7) String get blockchain;@HiveField(8) List<Transaction> get transactions;@HiveField(9) int get balance;@HiveField(10) int get lastAddressIndex;@HiveField(11) String get walletType;@HiveField(12) String get passPhrase;@HiveField(13) String get fingerprint;
/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalletCopyWith<Wallet> get copyWith => _$WalletCopyWithImpl<Wallet>(this as Wallet, _$identity);

  /// Serializes this Wallet to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Wallet&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.label, label) || other.label == label)&&(identical(other.descriptor, descriptor) || other.descriptor == descriptor)&&(identical(other.policy, policy) || other.policy == policy)&&(identical(other.requiredPolicyElements, requiredPolicyElements) || other.requiredPolicyElements == requiredPolicyElements)&&const DeepCollectionEquality().equals(other.policyElements, policyElements)&&(identical(other.blockchain, blockchain) || other.blockchain == blockchain)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.lastAddressIndex, lastAddressIndex) || other.lastAddressIndex == lastAddressIndex)&&(identical(other.walletType, walletType) || other.walletType == walletType)&&(identical(other.passPhrase, passPhrase) || other.passPhrase == passPhrase)&&(identical(other.fingerprint, fingerprint) || other.fingerprint == fingerprint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,label,descriptor,policy,requiredPolicyElements,const DeepCollectionEquality().hash(policyElements),blockchain,const DeepCollectionEquality().hash(transactions),balance,lastAddressIndex,walletType,passPhrase,fingerprint);

@override
String toString() {
  return 'Wallet(id: $id, uid: $uid, label: $label, descriptor: $descriptor, policy: $policy, requiredPolicyElements: $requiredPolicyElements, policyElements: $policyElements, blockchain: $blockchain, transactions: $transactions, balance: $balance, lastAddressIndex: $lastAddressIndex, walletType: $walletType, passPhrase: $passPhrase, fingerprint: $fingerprint)';
}


}

/// @nodoc
abstract mixin class $WalletCopyWith<$Res>  {
  factory $WalletCopyWith(Wallet value, $Res Function(Wallet) _then) = _$WalletCopyWithImpl;
@useResult
$Res call({
@HiveField(0) int? id,@HiveField(1) String uid,@HiveField(2) String label,@HiveField(3) String descriptor,@HiveField(4) String policy,@HiveField(5) int requiredPolicyElements,@HiveField(6) List<String> policyElements,@HiveField(7) String blockchain,@HiveField(8) List<Transaction> transactions,@HiveField(9) int balance,@HiveField(10) int lastAddressIndex,@HiveField(11) String walletType,@HiveField(12) String passPhrase,@HiveField(13) String fingerprint
});




}
/// @nodoc
class _$WalletCopyWithImpl<$Res>
    implements $WalletCopyWith<$Res> {
  _$WalletCopyWithImpl(this._self, this._then);

  final Wallet _self;
  final $Res Function(Wallet) _then;

/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? uid = null,Object? label = null,Object? descriptor = null,Object? policy = null,Object? requiredPolicyElements = null,Object? policyElements = null,Object? blockchain = null,Object? transactions = null,Object? balance = null,Object? lastAddressIndex = null,Object? walletType = null,Object? passPhrase = null,Object? fingerprint = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,descriptor: null == descriptor ? _self.descriptor : descriptor // ignore: cast_nullable_to_non_nullable
as String,policy: null == policy ? _self.policy : policy // ignore: cast_nullable_to_non_nullable
as String,requiredPolicyElements: null == requiredPolicyElements ? _self.requiredPolicyElements : requiredPolicyElements // ignore: cast_nullable_to_non_nullable
as int,policyElements: null == policyElements ? _self.policyElements : policyElements // ignore: cast_nullable_to_non_nullable
as List<String>,blockchain: null == blockchain ? _self.blockchain : blockchain // ignore: cast_nullable_to_non_nullable
as String,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<Transaction>,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,lastAddressIndex: null == lastAddressIndex ? _self.lastAddressIndex : lastAddressIndex // ignore: cast_nullable_to_non_nullable
as int,walletType: null == walletType ? _self.walletType : walletType // ignore: cast_nullable_to_non_nullable
as String,passPhrase: null == passPhrase ? _self.passPhrase : passPhrase // ignore: cast_nullable_to_non_nullable
as String,fingerprint: null == fingerprint ? _self.fingerprint : fingerprint // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Wallet].
extension WalletPatterns on Wallet {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Wallet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Wallet() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Wallet value)  $default,){
final _that = this;
switch (_that) {
case _Wallet():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Wallet value)?  $default,){
final _that = this;
switch (_that) {
case _Wallet() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  int? id, @HiveField(1)  String uid, @HiveField(2)  String label, @HiveField(3)  String descriptor, @HiveField(4)  String policy, @HiveField(5)  int requiredPolicyElements, @HiveField(6)  List<String> policyElements, @HiveField(7)  String blockchain, @HiveField(8)  List<Transaction> transactions, @HiveField(9)  int balance, @HiveField(10)  int lastAddressIndex, @HiveField(11)  String walletType, @HiveField(12)  String passPhrase, @HiveField(13)  String fingerprint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Wallet() when $default != null:
return $default(_that.id,_that.uid,_that.label,_that.descriptor,_that.policy,_that.requiredPolicyElements,_that.policyElements,_that.blockchain,_that.transactions,_that.balance,_that.lastAddressIndex,_that.walletType,_that.passPhrase,_that.fingerprint);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  int? id, @HiveField(1)  String uid, @HiveField(2)  String label, @HiveField(3)  String descriptor, @HiveField(4)  String policy, @HiveField(5)  int requiredPolicyElements, @HiveField(6)  List<String> policyElements, @HiveField(7)  String blockchain, @HiveField(8)  List<Transaction> transactions, @HiveField(9)  int balance, @HiveField(10)  int lastAddressIndex, @HiveField(11)  String walletType, @HiveField(12)  String passPhrase, @HiveField(13)  String fingerprint)  $default,) {final _that = this;
switch (_that) {
case _Wallet():
return $default(_that.id,_that.uid,_that.label,_that.descriptor,_that.policy,_that.requiredPolicyElements,_that.policyElements,_that.blockchain,_that.transactions,_that.balance,_that.lastAddressIndex,_that.walletType,_that.passPhrase,_that.fingerprint);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  int? id, @HiveField(1)  String uid, @HiveField(2)  String label, @HiveField(3)  String descriptor, @HiveField(4)  String policy, @HiveField(5)  int requiredPolicyElements, @HiveField(6)  List<String> policyElements, @HiveField(7)  String blockchain, @HiveField(8)  List<Transaction> transactions, @HiveField(9)  int balance, @HiveField(10)  int lastAddressIndex, @HiveField(11)  String walletType, @HiveField(12)  String passPhrase, @HiveField(13)  String fingerprint)?  $default,) {final _that = this;
switch (_that) {
case _Wallet() when $default != null:
return $default(_that.id,_that.uid,_that.label,_that.descriptor,_that.policy,_that.requiredPolicyElements,_that.policyElements,_that.blockchain,_that.transactions,_that.balance,_that.lastAddressIndex,_that.walletType,_that.passPhrase,_that.fingerprint);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'WalletClassAdapter')
class _Wallet extends Wallet {
  const _Wallet({@HiveField(0) this.id, @HiveField(1) required this.uid, @HiveField(2) required this.label, @HiveField(3) required this.descriptor, @HiveField(4) required this.policy, @HiveField(5) required this.requiredPolicyElements, @HiveField(6) required final  List<String> policyElements, @HiveField(7) required this.blockchain, @HiveField(8) required final  List<Transaction> transactions, @HiveField(9) required this.balance, @HiveField(10) required this.lastAddressIndex, @HiveField(11) required this.walletType, @HiveField(12) required this.passPhrase, @HiveField(13) required this.fingerprint}): _policyElements = policyElements,_transactions = transactions,super._();
  factory _Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

@override@HiveField(0) final  int? id;
@override@HiveField(1) final  String uid;
@override@HiveField(2) final  String label;
@override@HiveField(3) final  String descriptor;
@override@HiveField(4) final  String policy;
@override@HiveField(5) final  int requiredPolicyElements;
 final  List<String> _policyElements;
@override@HiveField(6) List<String> get policyElements {
  if (_policyElements is EqualUnmodifiableListView) return _policyElements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_policyElements);
}

@override@HiveField(7) final  String blockchain;
 final  List<Transaction> _transactions;
@override@HiveField(8) List<Transaction> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

@override@HiveField(9) final  int balance;
@override@HiveField(10) final  int lastAddressIndex;
@override@HiveField(11) final  String walletType;
@override@HiveField(12) final  String passPhrase;
@override@HiveField(13) final  String fingerprint;

/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalletCopyWith<_Wallet> get copyWith => __$WalletCopyWithImpl<_Wallet>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WalletToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Wallet&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.label, label) || other.label == label)&&(identical(other.descriptor, descriptor) || other.descriptor == descriptor)&&(identical(other.policy, policy) || other.policy == policy)&&(identical(other.requiredPolicyElements, requiredPolicyElements) || other.requiredPolicyElements == requiredPolicyElements)&&const DeepCollectionEquality().equals(other._policyElements, _policyElements)&&(identical(other.blockchain, blockchain) || other.blockchain == blockchain)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.lastAddressIndex, lastAddressIndex) || other.lastAddressIndex == lastAddressIndex)&&(identical(other.walletType, walletType) || other.walletType == walletType)&&(identical(other.passPhrase, passPhrase) || other.passPhrase == passPhrase)&&(identical(other.fingerprint, fingerprint) || other.fingerprint == fingerprint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,label,descriptor,policy,requiredPolicyElements,const DeepCollectionEquality().hash(_policyElements),blockchain,const DeepCollectionEquality().hash(_transactions),balance,lastAddressIndex,walletType,passPhrase,fingerprint);

@override
String toString() {
  return 'Wallet(id: $id, uid: $uid, label: $label, descriptor: $descriptor, policy: $policy, requiredPolicyElements: $requiredPolicyElements, policyElements: $policyElements, blockchain: $blockchain, transactions: $transactions, balance: $balance, lastAddressIndex: $lastAddressIndex, walletType: $walletType, passPhrase: $passPhrase, fingerprint: $fingerprint)';
}


}

/// @nodoc
abstract mixin class _$WalletCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$WalletCopyWith(_Wallet value, $Res Function(_Wallet) _then) = __$WalletCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) int? id,@HiveField(1) String uid,@HiveField(2) String label,@HiveField(3) String descriptor,@HiveField(4) String policy,@HiveField(5) int requiredPolicyElements,@HiveField(6) List<String> policyElements,@HiveField(7) String blockchain,@HiveField(8) List<Transaction> transactions,@HiveField(9) int balance,@HiveField(10) int lastAddressIndex,@HiveField(11) String walletType,@HiveField(12) String passPhrase,@HiveField(13) String fingerprint
});




}
/// @nodoc
class __$WalletCopyWithImpl<$Res>
    implements _$WalletCopyWith<$Res> {
  __$WalletCopyWithImpl(this._self, this._then);

  final _Wallet _self;
  final $Res Function(_Wallet) _then;

/// Create a copy of Wallet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? uid = null,Object? label = null,Object? descriptor = null,Object? policy = null,Object? requiredPolicyElements = null,Object? policyElements = null,Object? blockchain = null,Object? transactions = null,Object? balance = null,Object? lastAddressIndex = null,Object? walletType = null,Object? passPhrase = null,Object? fingerprint = null,}) {
  return _then(_Wallet(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,descriptor: null == descriptor ? _self.descriptor : descriptor // ignore: cast_nullable_to_non_nullable
as String,policy: null == policy ? _self.policy : policy // ignore: cast_nullable_to_non_nullable
as String,requiredPolicyElements: null == requiredPolicyElements ? _self.requiredPolicyElements : requiredPolicyElements // ignore: cast_nullable_to_non_nullable
as int,policyElements: null == policyElements ? _self._policyElements : policyElements // ignore: cast_nullable_to_non_nullable
as List<String>,blockchain: null == blockchain ? _self.blockchain : blockchain // ignore: cast_nullable_to_non_nullable
as String,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<Transaction>,balance: null == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int,lastAddressIndex: null == lastAddressIndex ? _self.lastAddressIndex : lastAddressIndex // ignore: cast_nullable_to_non_nullable
as int,walletType: null == walletType ? _self.walletType : walletType // ignore: cast_nullable_to_non_nullable
as String,passPhrase: null == passPhrase ? _self.passPhrase : passPhrase // ignore: cast_nullable_to_non_nullable
as String,fingerprint: null == fingerprint ? _self.fingerprint : fingerprint // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
