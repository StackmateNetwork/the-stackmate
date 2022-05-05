import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:bitcoin/bitcoin.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/model/transaction.dart';
import 'package:sats/model/result.dart';

class BitcoinFFI implements IStackMateCore {
  BitcoinFFI() {
    _bitcoin = FFFI(
      binary: Platform.isAndroid
          ? DynamicLibrary.open('libstackmate.so')
          : DynamicLibrary.open('libstackmate.dylib'),
    );
  }

  late FFFI _bitcoin;

  @override
  R<Seed> generateMaster({
    required String length,
    required String passphrase,
    required String network,
  }) {
    final resp = _bitcoin.generateMaster(
      length: length,
      passphrase: passphrase,
      network: network,
    );

    if (resp.contains('Error')) {
      return R(error: resp);
    }

    return R(result: Seed.fromJson(resp));
  }

  @override
  R<Seed> importMaster({
    required String mnemonic,
    required String passphrase,
    required String network,
  }) {
    final resp = _bitcoin.importMaster(
      mnemonic: mnemonic,
      passphrase: passphrase,
      network: network,
    );
    if (resp.contains('Error')) {
      return R(error: resp);
    }

    return R(result: Seed.fromJson(resp));
  }

  @override
  R<DerivedKeys> deriveHardened({
    required String masterXPriv,
    required String account,
    required String purpose,
  }) {
    final resp = _bitcoin.deriveHardened(
      masterXPriv: masterXPriv,
      account: account,
      purpose: purpose,
    );
    if (resp.contains('Error')) {
      return R(error: resp);
    }
    return R(result: DerivedKeys.fromJson(resp));
  }

  @override
  R<String> compile({
    required String policy,
    required String scriptType,
  }) {
    final resp = _bitcoin.compile(
      policy: policy,
      scriptType: scriptType,
    );
    if (resp.contains('Error')) {
      return R(error: resp);
    }

    return R(result: resp);
  }

  @override
  R<int> syncBalance({
    required String descriptor,
    required String nodeAddress,
  }) {
    final resp = _bitcoin.syncBalance(
      descriptor: descriptor,
      nodeAddress: nodeAddress,
    );
    if (resp.contains('Error')) {
      return R(error: resp);
    }

    final bal = jsonDecode(resp)['balance'];

    return R(result: bal as int);
  }

  @override
  R<String> getAddress({
    required String descriptor,
    required String index,
  }) {
    final resp = _bitcoin.getAddress(
      descriptor: descriptor,
      index: index,
    );

    if (resp.contains('Error')) {
      return R(error: resp);
    }

    final address = jsonDecode(resp)['address'];
    return R(result: address as String);
  }

  @override
  R<List<Transaction>> getHistory({
    required String descriptor,
    required String nodeAddress,
  }) {
    final resp = _bitcoin.getHistory(
      descriptor: descriptor,
      nodeAddress: nodeAddress,
    );
    if (resp.contains('Error')) {
      return R(error: resp);
    }
    final json = jsonDecode(resp);
    final List<Transaction> transactions = [];
    for (final t in json['history'] as List) {
      var tx = Transaction.fromJson(t as Map<String, dynamic>);
      if (!tx.isReceive())
        tx = tx.copyWith(sent: tx.sent - tx.received - tx.fee);

      transactions.add(tx);
    }

    transactions.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    return R(result: transactions);
  }

  @override
  R<PSBT> buildTransaction({
    required String descriptor,
    required String nodeAddress,
    required String txOutputs,
    required String feeAbsolute,
    required String policyPath,
    required String sweep,
  }) {
    final resp = _bitcoin.buildTransaction(
      descriptor: descriptor,
      nodeAddress: nodeAddress,
      txOutputs: txOutputs,
      feeAbsolute: feeAbsolute,
      policyPath: policyPath,
      sweep: sweep,
    );
    if (resp.contains('Error')) {
      return R(error: resp);
    }
    return R(result: PSBT.fromJson(resp));
  }

  @override
  R<List<DecodedTxOutput>> decodePsbt(
      {required String network, required String psbt}) {
    final resp = _bitcoin.decodePsbt(network: network, psbt: psbt);
    if (resp.contains('Error')) {
      return R(error: resp);
    }
    final json = jsonDecode(resp)['outputs'];

    final List<DecodedTxOutput> decoded = [];
    for (final out in json)
      decoded.add(DecodedTxOutput.fromJson(out as Map<String, dynamic>));

    return R(result: decoded);
  }

  @override
  R<PSBT> signTransaction({
    required String descriptor,
    required String unsignedPSBT,
  }) {
    final resp = _bitcoin.signTransaction(
      descriptor: descriptor,
      unsignedPSBT: unsignedPSBT,
    );
    if (resp.contains('Error')) {
      return R(error: resp);
    }
    return R(result: PSBT.fromJson(resp));
  }

  @override
  R<String> broadcastTransaction({
    required String descriptor,
    required String nodeAddress,
    required String signedPSBT,
  }) {
    final resp = _bitcoin.broadcastTransaction(
      descriptor: descriptor,
      nodeAddress: nodeAddress,
      signedPSBT: signedPSBT,
    );
    if (resp.contains('Error')) {
      return R(error: resp);
    }
    final data = jsonDecode(resp);
    return R(result: data['txid'] as String);
  }

  @override
  R<double> estimateNetworkFee({
    required String network,
    required String nodeAddress,
    required String targetSize,
  }) {
    final resp = _bitcoin.estimateNetworkFee(
      network: network,
      nodeAddress: nodeAddress,
      targetSize: targetSize,
    );
    if (resp.contains('Error')) {
      return R(error: resp);
    }
    final data = jsonDecode(resp);

    return R(result: data['rate'] as double);
  }

  @override
  R<int> getWeight({
    required String descriptor,
    required String psbt,
  }) {
    final resp = _bitcoin.getWeight(
      descriptor: descriptor,
      psbt: psbt,
    );
    if (resp.contains('Error')) {
      return R(error: resp);
    }

    final data = jsonDecode(resp);
    return R(result: data['weight'] as int);
  }

  @override
  R<AbsoluteFees> feeAbsoluteToRate({
    required String feeAbsolute,
    required String weight,
  }) {
    final resp = _bitcoin.feeAbsoluteToRate(
      feeAbs: feeAbsolute,
      weight: weight,
    );
    if (resp.contains('Error')) {
      return R(error: resp);
    }

    return R(result: AbsoluteFees.fromJson(resp));
  }

  @override
  R<AbsoluteFees> feeRateToAbsolute({
    required String feeRate,
    required String weight,
  }) {
    final resp = _bitcoin.feeRateToAbsolute(
      feeRate: feeRate,
      weight: weight,
    );
    if (resp.contains('Error')) {
      return R(error: resp);
    }

    return R(result: AbsoluteFees.fromJson(resp));
  }

  @override
  R<int> getHeight({
    required String network,
    required String nodeAddress,
  }) {
    final resp = _bitcoin.getHeight(
      network: network,
      nodeAddress: nodeAddress,
    );
    if (resp.contains('Error')) {
      return R(error: resp);
    }

    final data = jsonDecode(resp);
    return R(result: data['height'] as int);
  }
}
