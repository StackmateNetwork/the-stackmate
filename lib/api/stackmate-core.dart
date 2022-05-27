import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:bitcoin/bitcoin.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/model/result.dart';
import 'package:sats/model/transaction.dart';

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
      return R(error: SMError.fromJson(resp).message);
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
      return R(error: SMError.fromJson(resp).message);
    }
    return R(result: resp);
  }

  @override
  R<int> syncBalance({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
  }) {
    final resp = _bitcoin.syncBalance(
      descriptor: descriptor,
      nodeAddress: nodeAddress,
      socks5: socks5,
    );
    if (resp.contains('Error')) {
      return R(error: SMError.fromJson(resp).message);
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
      return R(error: SMError.fromJson(resp).message);
    }
    final address = jsonDecode(resp)['address'];
    return R(result: address as String);
  }

  @override
  R<List<Transaction>> getHistory({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
  }) {
    final resp = _bitcoin.getHistory(
      descriptor: descriptor,
      nodeAddress: nodeAddress,
      socks5: socks5,
    );
    if (resp.contains('Error')) {
      return R(error: SMError.fromJson(resp).message);
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
    final unconfirmed =
        transactions.where((item) => item.timestamp == 0).toList();
    final confirmed = transactions.where((item) => item.timestamp > 0).toList();
    final sorted = unconfirmed + confirmed;
    return R(result: sorted);
  }

  @override
  R<List<UTXO>> getUTXOSet({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
  }) {
    final resp = _bitcoin.listUnspent(
      descriptor: descriptor,
      nodeAddress: nodeAddress,
      socks5: socks5,
    );
    if (resp.contains('Error')) {
      return R(error: SMError.fromJson(resp).message);
    }
    final json = jsonDecode(resp);
    final List<UTXO> utxos = [];
    for (final t in json['utxos'] as List) {
      final utxo = UTXO.fromJson(t as Map<String, dynamic>);
      utxos.add(utxo);
    }
    return R(result: utxos);
  }

  @override
  R<PSBT> buildTransaction({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
    required String txOutputs,
    required String feeAbsolute,
    required String policyPath,
    required String sweep,
  }) {
    final resp = _bitcoin.buildTransaction(
      descriptor: descriptor,
      nodeAddress: nodeAddress,
      socks5: socks5,
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
  R<List<DecodedTxOutput>> decodePsbt({
    required String network,
    required String psbt,
  }) {
    final resp = _bitcoin.decodePsbt(network: network, psbt: psbt);
    if (resp.contains('Error')) {
      return R(error: SMError.fromJson(resp).message);
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
      return R(error: SMError.fromJson(resp).message);
    }
    return R(result: PSBT.fromJson(resp));
  }

  @override
  Future<R<String>> broadcastTransaction({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
    required String signedPSBT,
  }) async {
    final resp = await _bitcoin.broadcastTransaction(
      descriptor: descriptor,
      nodeAddress: nodeAddress,
      signedPSBT: signedPSBT,
      socks5: socks5,
    );
    if (resp.contains('Error')) {
      return R(error: SMError.fromJson(resp).message);
    }
    final data = jsonDecode(resp);
    return R(result: data['txid'] as String);
  }

  @override
  R<double> estimateNetworkFee({
    required String network,
    required String nodeAddress,
    required String socks5,
    required String targetSize,
  }) {
    // temp fix for fees while tor is loading
    if (socks5 == 'none') return const R(error: 'Tor Not Connected.');
    final resp = _bitcoin.estimateNetworkFee(
      network: network,
      nodeAddress: nodeAddress,
      targetSize: targetSize,
      socks5: socks5,
    );
    if (resp.contains('Error')) {
      return R(error: SMError.fromJson(resp).message);
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
      return R(error: SMError.fromJson(resp).message);
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
      return R(error: SMError.fromJson(resp).message);
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
      return R(error: SMError.fromJson(resp).message);
    }
    return R(result: AbsoluteFees.fromJson(resp));
  }
}
