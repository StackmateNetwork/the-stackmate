import 'dart:isolate';

import 'package:sats/api/libbitcoin.dart';
import 'package:sats/model/core.dart';
import 'package:sats/model/result.dart';
import 'package:sats/model/transaction.dart';

/// Runs blocking BDK calls on a background isolate.
///
/// BDK's FFI calls are synchronous and the ones touching the network or the
/// wallet database can take seconds, so the UI isolate must never call
/// [LibBitcoin] for them directly. Every method returns an [R]; use
/// [BitcoinResult.orThrow] where a failure should abort the caller.
abstract final class BitcoinWorker {
  static Future<R<String>> sync({
    required String descriptor,
    required String dbPath,
    required String nodeAddress,
    required String socks5,
  }) => Isolate.run(
    () => LibBitcoin().sqliteSync(
      descriptor: descriptor,
      dbPath: dbPath,
      nodeAddress: nodeAddress,
      socks5: socks5,
    ),
  );

  static Future<R<int>> balance({
    required String descriptor,
    required String dbPath,
  }) => Isolate.run(
    () => LibBitcoin().sqliteBalance(descriptor: descriptor, dbPath: dbPath),
  );

  static Future<R<List<Transaction>>> history({
    required String descriptor,
    required String dbPath,
  }) => Isolate.run(
    () => LibBitcoin().sqliteHistory(descriptor: descriptor, dbPath: dbPath),
  );

  static Future<R<int>> height({
    required String network,
    required String nodeAddress,
    required String socks5,
  }) => Isolate.run(
    () => LibBitcoin().getHeight(
      network: network,
      nodeAddress: nodeAddress,
      socks5: socks5,
    ),
  );

  static Future<R<double>> estimateFee({
    required String network,
    required String nodeAddress,
    required String socks5,
    required String targetSize,
  }) => Isolate.run(
    () => LibBitcoin().estimateNetworkFee(
      network: network,
      nodeAddress: nodeAddress,
      socks5: socks5,
      targetSize: targetSize,
    ),
  );

  static Future<R<Seed>> importMaster({
    required String mnemonic,
    required String passphrase,
    required String network,
  }) => Isolate.run(
    () => LibBitcoin().importMaster(
      mnemonic: mnemonic,
      passphrase: passphrase,
      network: network,
    ),
  );

  static Future<R<PSBT>> buildTx({
    required String descriptor,
    required String dbPath,
    required String txOutputs,
    required String feeAbsolute,
    required String policyPath,
    required String sweep,
  }) => Isolate.run(
    () => LibBitcoin().sqliteBuildTransaction(
      descriptor: descriptor,
      dbPath: dbPath,
      txOutputs: txOutputs,
      feeAbsolute: feeAbsolute,
      policyPath: policyPath,
      sweep: sweep,
    ),
  );

  static Future<R<PSBT>> bumpFee({
    required String descriptor,
    required String dbPath,
    required String txid,
    required String feeRate,
  }) => Isolate.run(
    () => LibBitcoin().sqliteBumpFee(
      descriptor: descriptor,
      dbPath: dbPath,
      txid: txid,
      feeRate: feeRate,
    ),
  );

  static Future<R<int>> weight({
    required String descriptor,
    required String psbt,
  }) => Isolate.run(
    () => LibBitcoin().getWeight(descriptor: descriptor, psbt: psbt),
  );

  static Future<R<List<DecodedTxOutput>>> decodePsbt({
    required String network,
    required String psbt,
  }) =>
      Isolate.run(() => LibBitcoin().decodePsbt(network: network, psbt: psbt));

  static Future<R<PSBT>> sign({
    required String descriptor,
    required String unsignedPSBT,
  }) => Isolate.run(
    () => LibBitcoin().signTransaction(
      descriptor: descriptor,
      unsignedPSBT: unsignedPSBT,
    ),
  );

  static Future<R<String>> broadcast({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
    required String signedPSBT,
  }) => Isolate.run(
    () => LibBitcoin().broadcastTransaction(
      descriptor: descriptor,
      nodeAddress: nodeAddress,
      socks5: socks5,
      signedPSBT: signedPSBT,
    ),
  );

  static Future<R<String>> broadcastHex({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
    required String signedHex,
  }) => Isolate.run(
    () => LibBitcoin().broadcastTransactionHex(
      descriptor: descriptor,
      nodeAddress: nodeAddress,
      socks5: socks5,
      signedHex: signedHex,
    ),
  );
}

extension BitcoinResult<T> on R<T> {
  /// The readable message of a wallet-engine error.
  String get errorMessage {
    final e = error;
    if (e == null) return '';
    try {
      return SMError.fromJson(e).message;
    } catch (_) {
      return e; // not an encoded SMError, e.g. a storage error
    }
  }

  /// Returns the result, or throws the error message.
  T orThrow() {
    if (hasError) throw errorMessage;
    return result as T;
  }
}
