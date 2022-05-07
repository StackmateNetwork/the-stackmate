import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:sats/model/transaction.dart';

part 'wallet.g.dart';
part 'wallet.freezed.dart';

const satsInBTC = 100000000;

@freezed
class Wallet with _$Wallet {
  @HiveType(typeId: 1, adapterName: 'WalletClassAdapter')
  const factory Wallet({
    @HiveField(0) required String label,
    @HiveField(1) required String descriptor,
    @HiveField(2) required String policy,
    @HiveField(3) required int requiredPolicyElements,
    @HiveField(4) required List<String> policyElements,
    @HiveField(5) required String blockchain,
    @HiveField(6) List<Transaction>? transactions,
    @HiveField(7) int? id,
    @HiveField(8) int? balance,
    @HiveField(9) int? lastAddressIndex,
    @HiveField(10) required String walletType,
  }) = _Wallet;
  const Wallet._();

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

  String balanceToBtc() =>
      balance == null ? '0' : (balance! / satsInBTC).toStringAsFixed(8);

  bool isNotWatchOnly() => label != 'WATCHER';

  int pendingPolicyElements() {
    return policyElements.length - requiredPolicyElements;
  }

  bool isScript() {
    return requiredPolicyElements > 1;
  }
}
