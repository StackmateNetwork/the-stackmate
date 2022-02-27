import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:sats/model/transaction.dart';

part 'wallet.g.dart';
part 'wallet.freezed.dart';

@freezed
class Wallet with _$Wallet {
  @HiveType(typeId: 1, adapterName: 'WalletClassAdaper')
  const factory Wallet({
    @HiveField(0) required String label,
    @HiveField(1) required InternalWallet mainWallet,
    @HiveField(2) required InternalWallet exportWallet,
    @HiveField(3) InternalWallet? backedupWallet,
    @HiveField(4) required String blockchain,
    @HiveField(5) List<Transaction>? transactions,
    @HiveField(6) int? id,
    @HiveField(7) int? balance,
    @HiveField(8) required String walletType,
    // @Default(false) @HiveField(7) bool watchOnly,
  }) = _Wallet;
  const Wallet._();

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

  String balanceToBtc() =>
      balance == null ? '0' : (balance! / 100000000).toStringAsFixed(8);

  bool isNotWatchOnly() => label != 'WATCH ONLY';
}

@freezed
class InternalWallet with _$InternalWallet {
  @HiveType(typeId: 2, adapterName: 'InternalWalletClassAdaper')
  const factory InternalWallet({
    @HiveField(0) String? xPriv,
    @HiveField(1) required String xPub,
    @HiveField(2) required String fingerPrint,
    @HiveField(3) required String path,
    @HiveField(4) String? descriptor,
    @HiveField(5) DateTime? rescueDate,
  }) = _InternalWallet;
  const InternalWallet._();

  factory InternalWallet.fromJson(Map<String, dynamic> json) =>
      _$InternalWalletFromJson(json);
}
