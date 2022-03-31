import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:bitcoin/bitcoin.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/model/result.dart';
import 'package:sats/model/transaction.dart';
import 'package:sats/pkg/_locator.dart';

class BitcoinFFI implements IStackMateCore {
  BitcoinFFI() {
    _bitcoin = FFFI(
      binary:
          Platform.isAndroid ? DynamicLibrary.open('libstackmate.so') : DynamicLibrary.executable(),
    );
  }

  late FFFI _bitcoin;

  @override
  R<Nmeu> generateMaster({
    required String length,
    required String passphrase,
    required String network,
  }) {
    try {
      final resp = _bitcoin.generateMaster(
        length: length,
        passphrase: passphrase,
        network: network,
      );

      if (resp.startsWith('Error')) throw resp;
      return R(result: Nmeu.fromJson(resp));
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<Nmeu> importMaster({
    required String mnemonic,
    required String passphrase,
    required String network,
  }) {
    try {
      final resp = _bitcoin.importMaster(
        mnemonic: mnemonic,
        passphrase: passphrase,
        network: network,
      );
      if (resp.startsWith('Error')) throw resp;
      return R(result: Nmeu.fromJson(resp));
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<DerivedWallet> deriveHardened({
    required String masterXPriv,
    required String account,
    required String purpose,
  }) {
    try {
      final resp = _bitcoin.deriveHardened(
        masterXPriv: masterXPriv,
        account: account,
        purpose: purpose,
      );
      if (resp.startsWith('Error')) throw resp;
      return R(result: DerivedWallet.fromJson(resp));
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<Compile> compile({
    required String policy,
    required String scriptType,
  }) {
    try {
      final resp = _bitcoin.compile(
        policy: policy,
        scriptType: scriptType,
      );
      if (resp.startsWith('Error')) throw resp;
      return R(result: Compile.fromJson(resp));
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<int> syncBalance({
    required String depositDesc,
    required String nodeAddress,
  }) {
    try {
      final resp = _bitcoin.syncBalance(
        depositDesc: depositDesc,
        nodeAddress: nodeAddress,
      );
      if (resp.contains('Error')) throw resp;
      final bal = jsonDecode(resp)['balance'];

      return R(result: bal as int);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<String> getAddress({
    required String depositDesc,
    required String nodeAddress,
    required String index,
  }) {
    try {
      final resp = _bitcoin.getAddress(
        depositDesc: depositDesc,
        nodeAddress: nodeAddress,
        index: index,
      );
      return R(result: resp);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<List<Transaction>> getHistory({
    required String depositDesc,
    required String nodeAddress,
  }) {
    try {
      final resp = _bitcoin.getHistory(
        depositDesc: depositDesc,
        nodeAddress: nodeAddress,
      );
      final json = jsonDecode(resp);
      final List<Transaction> transactions = [];
      for (final t in json['history'] as List) {
        var tx = Transaction.fromJson(t as Map<String, dynamic>);
        if (!tx.isReceive()) tx = tx.copyWith(sent: tx.sent - tx.received - tx.fee);

        transactions.add(tx);
      }

      transactions.sort((a, b) => b.timestamp.compareTo(a.timestamp));

      return R(result: transactions);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<String> buildTransaction({
    required String depositDesc,
    required String nodeAddress,
    required String toAddress,
    required String amount,
    required String feeAbsolute,
    required String sweep,
  }) {
    try {
      final resp = _bitcoin.buildTransaction(
        depositDesc: depositDesc,
        nodeAddress: nodeAddress,
        toAddress: toAddress,
        amount: amount,
        feeAbsolute: feeAbsolute,
        sweep: sweep,
      );
      final data = jsonDecode(resp);
      return R(result: data['psbt'] as String);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<String> decodePsbt({required String network, required String psbt}) {
    try {
      final resp = _bitcoin.decodePsbt(network: network, psbt: psbt);
      return R(result: resp);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<String> signTransaction({
    required String depositDesc,
    required String nodeAddress,
    required String unsignedPSBT,
  }) {
    try {
      final resp = _bitcoin.signTransaction(
        depositDesc: depositDesc,
        nodeAddress: nodeAddress,
        unsignedPSBT: unsignedPSBT,
      );
      final data = jsonDecode(resp);
      return R(result: data['psbt'] as String);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<String> broadcastTransaction({
    required String depositDesc,
    required String nodeAddress,
    required String signedPSBT,
  }) {
    try {
      final resp = _bitcoin.broadcastTransaction(
        depositDesc: depositDesc,
        nodeAddress: nodeAddress,
        signedPSBT: signedPSBT,
      );
      final data = jsonDecode(resp);
      return R(result: data['txid'] as String);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<double> estimateNetworkFee({
    required String targetSize,
    required String network,
    required String nodeAddress,
  }) {
    try {
      final resp = _bitcoin.estimateNetworkFee(
        targetSize: targetSize,
        network: network,
        nodeAddress: nodeAddress,
      );
      if (resp.startsWith('Error')) throw resp;
      final data = jsonDecode(resp);
      return R(result: data['rate'] as double);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<int> getWeight({
    required String depositDesc,
    required String psbt,
  }) {
    try {
      final resp = _bitcoin.getWeight(
        depositDesc: depositDesc,
        psbt: psbt,
      );
      if (resp.startsWith('Error')) throw resp;
      final data = jsonDecode(resp);
      return R(result: data['weight'] as int);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<AbsoluteFees> feeAbsoluteToRate({
    required String feeAbsolute,
    required String weight,
  }) {
    try {
      final resp = _bitcoin.feeAbsoluteToRate(
        feeAbs: feeAbsolute,
        weight: weight,
      );
      if (resp.startsWith('Error')) throw resp;
      return R(result: AbsoluteFees.fromJson(resp));
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<AbsoluteFees> feeRateToAbsolute({
    required String feeRate,
    required String weight,
  }) {
    try {
      final resp = _bitcoin.feeRateToAbsolute(
        feeRate: feeRate,
        weight: weight,
      );
      if (resp.startsWith('Error')) throw resp;
      return R(result: AbsoluteFees.fromJson(resp));
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<int> daysToBlocks({required String days}) {
    try {
      final resp = _bitcoin.daysToBlocks(
        days: days,
      );
      if (resp.startsWith('Error')) throw resp;
      final data = jsonDecode(resp);
      return R(result: data['height'] as int);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<int> getHeight({
    required String network,
    required String nodeAddress,
  }) {
    try {
      final resp = _bitcoin.getHeight(
        network: network,
        nodeAddress: nodeAddress,
      );
      if (resp.startsWith('Error')) throw resp;
      final data = jsonDecode(resp);
      return R(result: data['height'] as int);
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<DerivedWallet> derivePathStr({required String masterXPriv, required String derivationPath}) {
    try {
      // TODO: implement derivePathStr
      throw UnimplementedError();
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<String> sharedSecret({required String localPriv, required String remotePub}) {
    try {
      // TODO: implement sharedSecret
      throw UnimplementedError();
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<String> signMessage({required String message, required String secKey}) {
    try {
      // TODO: implement signMessage
      throw UnimplementedError();
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<bool> verifySignature({
    required String signature,
    required String message,
    required String pubkey,
  }) {
    try {
      // TODO: implement verifySignature
      throw UnimplementedError();
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }

  @override
  R<XOnlyPair> xPrivToEc({required String masterXPriv}) {
    try {
      // TODO: implement xPrivToEc
      throw UnimplementedError();
    } catch (e, s) {
      locator<Logger>().logException(e, '', s);
      return R(error: e.toString());
    }
  }
}
