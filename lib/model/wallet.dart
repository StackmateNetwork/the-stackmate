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
    @HiveField(0) int? id,
    @HiveField(1) required String uid,
    @HiveField(2) required String label,
    @HiveField(3) required String descriptor,
    @HiveField(4) required String policy,
    @HiveField(5) required int requiredPolicyElements,
    @HiveField(6) required List<String> policyElements,
    @HiveField(7) required String blockchain,
    @HiveField(8) required List<Transaction> transactions,
    @HiveField(9) required int balance,
    @HiveField(10) required int lastAddressIndex,
    @HiveField(11) required String walletType,
  }) = _Wallet;
  const Wallet._();

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

  String balanceToBtc() => (balance / satsInBTC).toStringAsFixed(8);

  bool isNotWatchOnly() => walletType != 'WATCHER';

  int pendingPolicyElements() {
    return policyElements.length - requiredPolicyElements;
  }

  bool isScript() {
    return requiredPolicyElements > 1;
  }
}
