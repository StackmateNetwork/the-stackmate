import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:bitcoin/bitcoin.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/model/transaction.dart';

class BitcoinFFI implements IStackMateCore {
  BitcoinFFI() {
    _bitcoin = FFFI(
      binary: Platform.isAndroid
          ? DynamicLibrary.open('libstackmate.so')
          : DynamicLibrary.executable(),
    );
  }

  late FFFI _bitcoin;

  @override
  Seed generateMaster({
    required String length,
    required String passphrase,
    required String network,
  }) {
    final resp = _bitcoin.generateMaster(
      length: length,
      passphrase: passphrase,
      network: network,
    );

    if (resp.startsWith('Error')) throw resp;
    return Seed.fromJson(resp);
  }

  @override
  Seed importMaster({
    required String mnemonic,
    required String passphrase,
    required String network,
  }) {
    final resp = _bitcoin.importMaster(
      mnemonic: mnemonic,
      passphrase: passphrase,
      network: network,
    );
    if (resp.startsWith('Error')) throw resp;
    return Seed.fromJson(resp);
  }

  @override
  DerivedKeys deriveHardened({
    required String masterXPriv,
    required String account,
    required String purpose,
  }) {
    final resp = _bitcoin.deriveHardened(
      masterXPriv: masterXPriv,
      account: account,
      purpose: purpose,
    );
    if (resp.startsWith('Error')) throw resp;
    return DerivedKeys.fromJson(resp);
  }

  @override
  String compile({
    required String policy,
    required String scriptType,
  }) {
    final resp = _bitcoin.compile(
      policy: policy,
      scriptType: scriptType,
    );
    if (resp.startsWith('Error')) throw resp;
    return resp;
  }

  @override
  int syncBalance({
    required String descriptor,
    required String nodeAddress,
  }) {
    final resp = _bitcoin.syncBalance(
      descriptor: descriptor,
      nodeAddress: nodeAddress,
    );
    if (resp.contains('Error')) throw resp;
    final bal = jsonDecode(resp)['balance'];

    return bal as int;
  }

  @override
  String getAddress({
    required String descriptor,
    required String index,
  }) {
    final resp = _bitcoin.getAddress(
      descriptor: descriptor,
      index: index,
    );
    return resp;
  }

  @override
  List<Transaction> getHistory({
    required String descriptor,
    required String nodeAddress,
  }) {
    final resp = _bitcoin.getHistory(
      descriptor: descriptor,
      nodeAddress: nodeAddress,
    );
    final json = jsonDecode(resp);
    final List<Transaction> transactions = [];
    for (final t in json['history'] as List) {
      var tx = Transaction.fromJson(t as Map<String, dynamic>);
      if (!tx.isReceive())
        tx = tx.copyWith(sent: tx.sent - tx.received - tx.fee);

      transactions.add(tx);
    }

    transactions.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    return transactions;
  }

  @override
  String buildTransaction({
    required String descriptor,
    required String nodeAddress,
    required String txOutputs,
    required String feeAbsolute,
    required String sweep,
    required String policyPath,
  }) {
    final resp = _bitcoin.buildTransaction(
      descriptor: descriptor,
      nodeAddress: nodeAddress,
      txOutputs: txOutputs,
      feeAbsolute: feeAbsolute,
      sweep: sweep,
      policyPath: policyPath,
    );
    final data = jsonDecode(resp);
    if (data['error'] != null) return data['error'] as String;
    return data['psbt'] as String;
  }

  @override
  String decodePsbt({required String network, required String psbt}) {
    final resp = _bitcoin.decodePsbt(network: network, psbt: psbt);
    return resp;
  }

  @override
  String signTransaction({
    required String descriptor,
    required String unsignedPSBT,
  }) {
    final resp = _bitcoin.signTransaction(
      descriptor: descriptor,
      unsignedPSBT: unsignedPSBT,
    );
    final data = jsonDecode(resp);
    if (data['error'] != null) return data['error'] as String;
    return data['psbt'] as String;
  }

  @override
  String broadcastTransaction({
    required String descriptor,
    required String nodeAddress,
    required String signedPSBT,
  }) {
    final resp = _bitcoin.broadcastTransaction(
      descriptor: descriptor,
      nodeAddress: nodeAddress,
      signedPSBT: signedPSBT,
    );
    final data = jsonDecode(resp);
    return data['txid'] as String;
  }

  @override
  double estimateNetworkFee({
    required String network,
    required String nodeAddress,
    required String targetSize,
  }) {
    final resp = _bitcoin.estimateNetworkFee(
      network: network,
      nodeAddress: nodeAddress,
      targetSize: targetSize,
    );
    final data = jsonDecode(resp);
    if (data['error'] != null) {
      print(data);
      return 3.0;
    }

    return data['rate'] as double;
  }

  @override
  int getWeight({
    required String descriptor,
    required String psbt,
  }) {
    final resp = _bitcoin.getWeight(
      descriptor: descriptor,
      psbt: psbt,
    );
    if (resp.startsWith('Error')) throw resp;
    final data = jsonDecode(resp);
    return data['weight'] as int;
  }

  @override
  AbsoluteFees feeAbsoluteToRate({
    required String feeAbsolute,
    required String weight,
  }) {
    final resp = _bitcoin.feeAbsoluteToRate(
      feeAbs: feeAbsolute,
      weight: weight,
    );
    if (resp.startsWith('Error')) throw resp;
    return AbsoluteFees.fromJson(resp);
  }

  @override
  AbsoluteFees feeRateToAbsolute({
    required String feeRate,
    required String weight,
  }) {
    final resp = _bitcoin.feeRateToAbsolute(
      feeRate: feeRate,
      weight: weight,
    );
    if (resp.startsWith('Error')) throw resp;
    return AbsoluteFees.fromJson(resp);
  }

  @override
  int daysToBlocks({required String days}) {
    final resp = _bitcoin.daysToBlocks(
      days: days,
    );
    if (resp.startsWith('Error')) throw resp;
    final data = jsonDecode(resp);
    return data['height'] as int;
  }

  @override
  int getHeight({
    required String network,
    required String nodeAddress,
  }) {
    final resp = _bitcoin.getHeight(
      network: network,
      nodeAddress: nodeAddress,
    );
    if (resp.startsWith('Error')) throw resp;
    final data = jsonDecode(resp);
    return data['height'] as int;
  }

  @override
  DerivedKeys derivePathStr(
      {required String masterXPriv, required String derivationPath}) {
    // TODO: implement derivePathStr
    throw UnimplementedError();
  }

  @override
  String sharedSecret({required String localPriv, required String remotePub}) {
    // TODO: implement sharedSecret
    throw UnimplementedError();
  }

  @override
  String signMessage({required String message, required String secKey}) {
    // TODO: implement signMessage
    throw UnimplementedError();
  }

  @override
  bool verifySignature({
    required String signature,
    required String message,
    required String pubkey,
  }) {
    // TODO: implement verifySignature
    throw UnimplementedError();
  }

  @override
  XOnlyPair xPrivToEc({required String masterXPriv}) {
    // TODO: implement xPrivToEc
    throw UnimplementedError();
  }
}
