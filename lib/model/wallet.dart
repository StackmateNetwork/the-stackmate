// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:sats/model/transaction.dart';

part 'wallet.g.dart';
part 'wallet.freezed.dart';

const satsInBTC = 100000000;

/// Values of [Wallet.walletType]. They are persisted, so never change them.
abstract final class WalletType {
  /// Signs with the app's master key.
  static const primary = 'PRIMARY';

  /// Signs with an imported (recovered) mnemonic.
  static const recovered = 'RECOVERED';

  /// Watch-only: builds PSBTs that are signed elsewhere.
  static const watcher = 'WATCHER';
}

@freezed
abstract class Wallet with _$Wallet {
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
    @HiveField(12) required String passPhrase,
    @HiveField(13) required String fingerprint,
  }) = _Wallet;
  const Wallet._();

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

  String balanceToBtc() => (balance / satsInBTC).toStringAsFixed(8);

  bool get isWatchOnly => walletType == WalletType.watcher;

  bool isNotWatchOnly() => !isWatchOnly;

  bool get canSign =>
      walletType == WalletType.primary || walletType == WalletType.recovered;

  int pendingPolicyElements() {
    return policyElements.length - requiredPolicyElements;
  }

  bool isScript() {
    return requiredPolicyElements > 1;
  }
}
