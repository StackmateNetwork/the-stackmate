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
      @HiveField(1) required InternalWallet mainWallet,
      @HiveField(2) required InternalWallet exportWallet,
      @HiveField(3) InternalWallet? backedupWallet,
      @HiveField(4) required String blockchain,
      @HiveField(5) List<Transaction>? transactions,
      @HiveField(6) int? id,
      @HiveField(7) int? balance,
      @HiveField(8) required String walletType}) {
    return _Wallet(
      label: label,
      mainWallet: mainWallet,
      exportWallet: exportWallet,
      backedupWallet: backedupWallet,
      blockchain: blockchain,
      transactions: transactions,
      id: id,
      balance: balance,
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
  InternalWallet get mainWallet => throw _privateConstructorUsedError;
  @HiveField(2)
  InternalWallet get exportWallet => throw _privateConstructorUsedError;
  @HiveField(3)
  InternalWallet? get backedupWallet => throw _privateConstructorUsedError;
  @HiveField(4)
  String get blockchain => throw _privateConstructorUsedError;
  @HiveField(5)
  List<Transaction>? get transactions => throw _privateConstructorUsedError;
  @HiveField(6)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(7)
  int? get balance => throw _privateConstructorUsedError;
  @HiveField(8)
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
      @HiveField(1) InternalWallet mainWallet,
      @HiveField(2) InternalWallet exportWallet,
      @HiveField(3) InternalWallet? backedupWallet,
      @HiveField(4) String blockchain,
      @HiveField(5) List<Transaction>? transactions,
      @HiveField(6) int? id,
      @HiveField(7) int? balance,
      @HiveField(8) String walletType});

  $InternalWalletCopyWith<$Res> get mainWallet;
  $InternalWalletCopyWith<$Res> get exportWallet;
  $InternalWalletCopyWith<$Res>? get backedupWallet;
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
    Object? mainWallet = freezed,
    Object? exportWallet = freezed,
    Object? backedupWallet = freezed,
    Object? blockchain = freezed,
    Object? transactions = freezed,
    Object? id = freezed,
    Object? balance = freezed,
    Object? walletType = freezed,
  }) {
    return _then(_value.copyWith(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      mainWallet: mainWallet == freezed
          ? _value.mainWallet
          : mainWallet // ignore: cast_nullable_to_non_nullable
              as InternalWallet,
      exportWallet: exportWallet == freezed
          ? _value.exportWallet
          : exportWallet // ignore: cast_nullable_to_non_nullable
              as InternalWallet,
      backedupWallet: backedupWallet == freezed
          ? _value.backedupWallet
          : backedupWallet // ignore: cast_nullable_to_non_nullable
              as InternalWallet?,
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
              as int?,
      walletType: walletType == freezed
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $InternalWalletCopyWith<$Res> get mainWallet {
    return $InternalWalletCopyWith<$Res>(_value.mainWallet, (value) {
      return _then(_value.copyWith(mainWallet: value));
    });
  }

  @override
  $InternalWalletCopyWith<$Res> get exportWallet {
    return $InternalWalletCopyWith<$Res>(_value.exportWallet, (value) {
      return _then(_value.copyWith(exportWallet: value));
    });
  }

  @override
  $InternalWalletCopyWith<$Res>? get backedupWallet {
    if (_value.backedupWallet == null) {
      return null;
    }

    return $InternalWalletCopyWith<$Res>(_value.backedupWallet!, (value) {
      return _then(_value.copyWith(backedupWallet: value));
    });
  }
}

/// @nodoc
abstract class _$WalletCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$WalletCopyWith(_Wallet value, $Res Function(_Wallet) then) =
      __$WalletCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String label,
      @HiveField(1) InternalWallet mainWallet,
      @HiveField(2) InternalWallet exportWallet,
      @HiveField(3) InternalWallet? backedupWallet,
      @HiveField(4) String blockchain,
      @HiveField(5) List<Transaction>? transactions,
      @HiveField(6) int? id,
      @HiveField(7) int? balance,
      @HiveField(8) String walletType});

  @override
  $InternalWalletCopyWith<$Res> get mainWallet;
  @override
  $InternalWalletCopyWith<$Res> get exportWallet;
  @override
  $InternalWalletCopyWith<$Res>? get backedupWallet;
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
    Object? mainWallet = freezed,
    Object? exportWallet = freezed,
    Object? backedupWallet = freezed,
    Object? blockchain = freezed,
    Object? transactions = freezed,
    Object? id = freezed,
    Object? balance = freezed,
    Object? walletType = freezed,
  }) {
    return _then(_Wallet(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      mainWallet: mainWallet == freezed
          ? _value.mainWallet
          : mainWallet // ignore: cast_nullable_to_non_nullable
              as InternalWallet,
      exportWallet: exportWallet == freezed
          ? _value.exportWallet
          : exportWallet // ignore: cast_nullable_to_non_nullable
              as InternalWallet,
      backedupWallet: backedupWallet == freezed
          ? _value.backedupWallet
          : backedupWallet // ignore: cast_nullable_to_non_nullable
              as InternalWallet?,
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
              as int?,
      walletType: walletType == freezed
          ? _value.walletType
          : walletType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'WalletClassAdaper')
class _$_Wallet extends _Wallet {
  const _$_Wallet(
      {@HiveField(0) required this.label,
      @HiveField(1) required this.mainWallet,
      @HiveField(2) required this.exportWallet,
      @HiveField(3) this.backedupWallet,
      @HiveField(4) required this.blockchain,
      @HiveField(5) this.transactions,
      @HiveField(6) this.id,
      @HiveField(7) this.balance,
      @HiveField(8) required this.walletType})
      : super._();

  factory _$_Wallet.fromJson(Map<String, dynamic> json) =>
      _$$_WalletFromJson(json);

  @override
  @HiveField(0)
  final String label;
  @override
  @HiveField(1)
  final InternalWallet mainWallet;
  @override
  @HiveField(2)
  final InternalWallet exportWallet;
  @override
  @HiveField(3)
  final InternalWallet? backedupWallet;
  @override
  @HiveField(4)
  final String blockchain;
  @override
  @HiveField(5)
  final List<Transaction>? transactions;
  @override
  @HiveField(6)
  final int? id;
  @override
  @HiveField(7)
  final int? balance;
  @override
  @HiveField(8)
  final String walletType;

  @override
  String toString() {
    return 'Wallet(label: $label, mainWallet: $mainWallet, exportWallet: $exportWallet, backedupWallet: $backedupWallet, blockchain: $blockchain, transactions: $transactions, id: $id, balance: $balance, walletType: $walletType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Wallet &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.mainWallet, mainWallet) ||
                const DeepCollectionEquality()
                    .equals(other.mainWallet, mainWallet)) &&
            (identical(other.exportWallet, exportWallet) ||
                const DeepCollectionEquality()
                    .equals(other.exportWallet, exportWallet)) &&
            (identical(other.backedupWallet, backedupWallet) ||
                const DeepCollectionEquality()
                    .equals(other.backedupWallet, backedupWallet)) &&
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
            (identical(other.walletType, walletType) ||
                const DeepCollectionEquality()
                    .equals(other.walletType, walletType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(mainWallet) ^
      const DeepCollectionEquality().hash(exportWallet) ^
      const DeepCollectionEquality().hash(backedupWallet) ^
      const DeepCollectionEquality().hash(blockchain) ^
      const DeepCollectionEquality().hash(transactions) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(balance) ^
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
      @HiveField(1) required InternalWallet mainWallet,
      @HiveField(2) required InternalWallet exportWallet,
      @HiveField(3) InternalWallet? backedupWallet,
      @HiveField(4) required String blockchain,
      @HiveField(5) List<Transaction>? transactions,
      @HiveField(6) int? id,
      @HiveField(7) int? balance,
      @HiveField(8) required String walletType}) = _$_Wallet;
  const _Wallet._() : super._();

  factory _Wallet.fromJson(Map<String, dynamic> json) = _$_Wallet.fromJson;

  @override
  @HiveField(0)
  String get label => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  InternalWallet get mainWallet => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  InternalWallet get exportWallet => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  InternalWallet? get backedupWallet => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String get blockchain => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  List<Transaction>? get transactions => throw _privateConstructorUsedError;
  @override
  @HiveField(6)
  int? get id => throw _privateConstructorUsedError;
  @override
  @HiveField(7)
  int? get balance => throw _privateConstructorUsedError;
  @override
  @HiveField(8)
  String get walletType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WalletCopyWith<_Wallet> get copyWith => throw _privateConstructorUsedError;
}

InternalWallet _$InternalWalletFromJson(Map<String, dynamic> json) {
  return _InternalWallet.fromJson(json);
}

/// @nodoc
class _$InternalWalletTearOff {
  const _$InternalWalletTearOff();

  _InternalWallet call(
      {@HiveField(0) String? xPriv,
      @HiveField(1) required String xPub,
      @HiveField(2) required String fingerPrint,
      @HiveField(3) required String path,
      @HiveField(4) String? descriptor,
      @HiveField(5) DateTime? rescueDate}) {
    return _InternalWallet(
      xPriv: xPriv,
      xPub: xPub,
      fingerPrint: fingerPrint,
      path: path,
      descriptor: descriptor,
      rescueDate: rescueDate,
    );
  }

  InternalWallet fromJson(Map<String, Object> json) {
    return InternalWallet.fromJson(json);
  }
}

/// @nodoc
const $InternalWallet = _$InternalWalletTearOff();

/// @nodoc
mixin _$InternalWallet {
  @HiveField(0)
  String? get xPriv => throw _privateConstructorUsedError;
  @HiveField(1)
  String get xPub => throw _privateConstructorUsedError;
  @HiveField(2)
  String get fingerPrint => throw _privateConstructorUsedError;
  @HiveField(3)
  String get path => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get descriptor => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime? get rescueDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InternalWalletCopyWith<InternalWallet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InternalWalletCopyWith<$Res> {
  factory $InternalWalletCopyWith(
          InternalWallet value, $Res Function(InternalWallet) then) =
      _$InternalWalletCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String? xPriv,
      @HiveField(1) String xPub,
      @HiveField(2) String fingerPrint,
      @HiveField(3) String path,
      @HiveField(4) String? descriptor,
      @HiveField(5) DateTime? rescueDate});
}

/// @nodoc
class _$InternalWalletCopyWithImpl<$Res>
    implements $InternalWalletCopyWith<$Res> {
  _$InternalWalletCopyWithImpl(this._value, this._then);

  final InternalWallet _value;
  // ignore: unused_field
  final $Res Function(InternalWallet) _then;

  @override
  $Res call({
    Object? xPriv = freezed,
    Object? xPub = freezed,
    Object? fingerPrint = freezed,
    Object? path = freezed,
    Object? descriptor = freezed,
    Object? rescueDate = freezed,
  }) {
    return _then(_value.copyWith(
      xPriv: xPriv == freezed
          ? _value.xPriv
          : xPriv // ignore: cast_nullable_to_non_nullable
              as String?,
      xPub: xPub == freezed
          ? _value.xPub
          : xPub // ignore: cast_nullable_to_non_nullable
              as String,
      fingerPrint: fingerPrint == freezed
          ? _value.fingerPrint
          : fingerPrint // ignore: cast_nullable_to_non_nullable
              as String,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      descriptor: descriptor == freezed
          ? _value.descriptor
          : descriptor // ignore: cast_nullable_to_non_nullable
              as String?,
      rescueDate: rescueDate == freezed
          ? _value.rescueDate
          : rescueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$InternalWalletCopyWith<$Res>
    implements $InternalWalletCopyWith<$Res> {
  factory _$InternalWalletCopyWith(
          _InternalWallet value, $Res Function(_InternalWallet) then) =
      __$InternalWalletCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String? xPriv,
      @HiveField(1) String xPub,
      @HiveField(2) String fingerPrint,
      @HiveField(3) String path,
      @HiveField(4) String? descriptor,
      @HiveField(5) DateTime? rescueDate});
}

/// @nodoc
class __$InternalWalletCopyWithImpl<$Res>
    extends _$InternalWalletCopyWithImpl<$Res>
    implements _$InternalWalletCopyWith<$Res> {
  __$InternalWalletCopyWithImpl(
      _InternalWallet _value, $Res Function(_InternalWallet) _then)
      : super(_value, (v) => _then(v as _InternalWallet));

  @override
  _InternalWallet get _value => super._value as _InternalWallet;

  @override
  $Res call({
    Object? xPriv = freezed,
    Object? xPub = freezed,
    Object? fingerPrint = freezed,
    Object? path = freezed,
    Object? descriptor = freezed,
    Object? rescueDate = freezed,
  }) {
    return _then(_InternalWallet(
      xPriv: xPriv == freezed
          ? _value.xPriv
          : xPriv // ignore: cast_nullable_to_non_nullable
              as String?,
      xPub: xPub == freezed
          ? _value.xPub
          : xPub // ignore: cast_nullable_to_non_nullable
              as String,
      fingerPrint: fingerPrint == freezed
          ? _value.fingerPrint
          : fingerPrint // ignore: cast_nullable_to_non_nullable
              as String,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      descriptor: descriptor == freezed
          ? _value.descriptor
          : descriptor // ignore: cast_nullable_to_non_nullable
              as String?,
      rescueDate: rescueDate == freezed
          ? _value.rescueDate
          : rescueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 2, adapterName: 'InternalWalletClassAdaper')
class _$_InternalWallet extends _InternalWallet {
  const _$_InternalWallet(
      {@HiveField(0) this.xPriv,
      @HiveField(1) required this.xPub,
      @HiveField(2) required this.fingerPrint,
      @HiveField(3) required this.path,
      @HiveField(4) this.descriptor,
      @HiveField(5) this.rescueDate})
      : super._();

  factory _$_InternalWallet.fromJson(Map<String, dynamic> json) =>
      _$$_InternalWalletFromJson(json);

  @override
  @HiveField(0)
  final String? xPriv;
  @override
  @HiveField(1)
  final String xPub;
  @override
  @HiveField(2)
  final String fingerPrint;
  @override
  @HiveField(3)
  final String path;
  @override
  @HiveField(4)
  final String? descriptor;
  @override
  @HiveField(5)
  final DateTime? rescueDate;

  @override
  String toString() {
    return 'InternalWallet(xPriv: $xPriv, xPub: $xPub, fingerPrint: $fingerPrint, path: $path, descriptor: $descriptor, rescueDate: $rescueDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InternalWallet &&
            (identical(other.xPriv, xPriv) ||
                const DeepCollectionEquality().equals(other.xPriv, xPriv)) &&
            (identical(other.xPub, xPub) ||
                const DeepCollectionEquality().equals(other.xPub, xPub)) &&
            (identical(other.fingerPrint, fingerPrint) ||
                const DeepCollectionEquality()
                    .equals(other.fingerPrint, fingerPrint)) &&
            (identical(other.path, path) ||
                const DeepCollectionEquality().equals(other.path, path)) &&
            (identical(other.descriptor, descriptor) ||
                const DeepCollectionEquality()
                    .equals(other.descriptor, descriptor)) &&
            (identical(other.rescueDate, rescueDate) ||
                const DeepCollectionEquality()
                    .equals(other.rescueDate, rescueDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(xPriv) ^
      const DeepCollectionEquality().hash(xPub) ^
      const DeepCollectionEquality().hash(fingerPrint) ^
      const DeepCollectionEquality().hash(path) ^
      const DeepCollectionEquality().hash(descriptor) ^
      const DeepCollectionEquality().hash(rescueDate);

  @JsonKey(ignore: true)
  @override
  _$InternalWalletCopyWith<_InternalWallet> get copyWith =>
      __$InternalWalletCopyWithImpl<_InternalWallet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InternalWalletToJson(this);
  }
}

abstract class _InternalWallet extends InternalWallet {
  const factory _InternalWallet(
      {@HiveField(0) String? xPriv,
      @HiveField(1) required String xPub,
      @HiveField(2) required String fingerPrint,
      @HiveField(3) required String path,
      @HiveField(4) String? descriptor,
      @HiveField(5) DateTime? rescueDate}) = _$_InternalWallet;
  const _InternalWallet._() : super._();

  factory _InternalWallet.fromJson(Map<String, dynamic> json) =
      _$_InternalWallet.fromJson;

  @override
  @HiveField(0)
  String? get xPriv => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  String get xPub => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  String get fingerPrint => throw _privateConstructorUsedError;
  @override
  @HiveField(3)
  String get path => throw _privateConstructorUsedError;
  @override
  @HiveField(4)
  String? get descriptor => throw _privateConstructorUsedError;
  @override
  @HiveField(5)
  DateTime? get rescueDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InternalWalletCopyWith<_InternalWallet> get copyWith =>
      throw _privateConstructorUsedError;
}
