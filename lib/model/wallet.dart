import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:sats/model/transaction.dart';

part 'wallet.g.dart';
part 'wallet.freezed.dart';

const satsInBTC = 100000000;

@freezed
class Wallet with _$Wallet {
  @HiveType(typeId: 1, adapterName: 'WalletClassAdaper')
  const factory Wallet({
    @HiveField(0) required String label,
    @HiveField(1) required String descriptor,
    @HiveField(2) required int requiredPolicyElements,
    @HiveField(2) required List<String> policyElements,
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
      balance == null ? '0' : (balance! / satsInBTC).toStringAsFixed(8);

  bool isNotWatchOnly() => label != 'WATCH ONLY';
}

enum policyElements {
  publicKey("[fingerprint/path]xkey"),
  timeLock("7894564"),
  hashLock("9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08");
  
  const policyElements(this.value);
  final String value;
}
