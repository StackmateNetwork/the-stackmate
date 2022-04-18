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
    @HiveField(9) required String walletType,
    // @Default(false) @HiveField(7) bool watchOnly,
  }) = _Wallet;
  const Wallet._();

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

  String balanceToBtc() =>
      balance == null ? '0' : (balance! / satsInBTC).toStringAsFixed(8);

  bool isNotWatchOnly() => label != 'WATCH ONLY';

  int pendingPolicyElements() {
    return policyElements.length - requiredPolicyElements;
  }
}
// enum PolicyElement <T extends Object> {
//   // Example Policy: 
//   // or(pk(___main___),and(after(___exit-timelock___),hash160(___exit-secret___)))
//   publicKey<String,String>("[fingerprint/path]xkey","___main___"),
//   timeLock<String,String>("7894564","___exit-timelock___"),
//   hashLock<String,String>("9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08","___exit-secret___");
  
//   const PolicyElement(this.value, this,.identifier);
//   final T <value, identifier>;
// }