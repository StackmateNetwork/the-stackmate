import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:bitcoin/bitcoin.dart';
import 'package:sats/model/transaction.dart';

abstract class IStackMateCore {
  DerivedWallet derivePathStr({
    required String masterXPriv,
    required String derivationPath,
  });

  XOnlyPair xPrivToEc({required String masterXPriv});

  String sharedSecret({
    required String localPriv,
    required String remotePub,
  });

  String signMessage({
    required String message,
    required String secKey,
  });

  bool verifySignature({
    required String signature,
    required String message,
    required String pubkey,
  });

  Nmeu generateMaster({
    required String length,
    required String passphrase,
    required String network,
  });

  Nmeu importMaster({
    required String mnemonic,
    required String passphrase,
    required String network,
  });

  DerivedWallet deriveHardened({
    required String masterXPriv,
    required String account,
    required String purpose,
  });

  Compile compile({
    required String policy,
    required String scriptType,
  });

  double estimateNetworkFee({
    required String targetSize,
    required String network,
    required String nodeAddress,
  });

  int getWeight({
    required String depositDesc,
    required String psbt,
  });

  AbsoluteFees feeAbsoluteToRate({
    required String feeAbsolute,
    required String weight,
  });

  AbsoluteFees feeRateToAbsolute({
    required String feeRate,
    required String weight,
  });

  int syncBalance({
    required String depositDesc,
    required String nodeAddress,
  });

  List<Transaction> getHistory({
    required String depositDesc,
    required String nodeAddress,
  });

  String getAddress({
    required String depositDesc,
    required String nodeAddress,
    required String index,
  });

  String buildTransaction({
    required String depositDesc,
    required String nodeAddress,
    required String toAddress,
    required String amount,
    required String feeAbsolute,
    required String sweep,
  });

  String decodePsbt({
    required String network,
    required String psbt,
  });

  String signTransaction({
    required String depositDesc,
    required String nodeAddress,
    required String unsignedPSBT,
  });

  String broadcastTransaction({
    required String depositDesc,
    required String nodeAddress,
    required String signedPSBT,
  });

  int getHeight({
    required String network,
    required String nodeAddress,
  });

  int daysToBlocks({required String days});
}

class BitcoinFFI implements IStackMateCore {
  BitcoinFFI() {
    _bitcoin = FFFI(
      binary:
          Platform.isAndroid ? DynamicLibrary.open('libstackmate.so') : DynamicLibrary.executable(),
    );
  }

  late FFFI _bitcoin;

  @override
  Nmeu generateMaster({
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
    return Nmeu.fromJson(resp);
  }

  @override
  Nmeu importMaster({
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
    return Nmeu.fromJson(resp);
  }

  @override
  DerivedWallet deriveHardened({
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
    return DerivedWallet.fromJson(resp);
  }

  @override
  Compile compile({
    required String policy,
    required String scriptType,
  }) {
    final resp = _bitcoin.compile(
      policy: policy,
      scriptType: scriptType,
    );
    if (resp.startsWith('Error')) throw resp;
    return Compile.fromJson(resp);
  }

  @override
  int syncBalance({
    required String depositDesc,
    required String nodeAddress,
  }) {
    final resp = _bitcoin.syncBalance(
      depositDesc: depositDesc,
      nodeAddress: nodeAddress,
    );
    if (resp.contains('Error')) throw resp;
    final bal = jsonDecode(resp)['balance'];

    return bal as int;
  }

  @override
  String getAddress({
    required String depositDesc,
    required String nodeAddress,
    required String index,
  }) {
    final resp = _bitcoin.getAddress(
      depositDesc: depositDesc,
      nodeAddress: nodeAddress,
      index: index,
    );
    return resp;
  }

  @override
  List<Transaction> getHistory({
    required String depositDesc,
    required String nodeAddress,
  }) {
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

    return transactions;
  }

  @override
  String buildTransaction({
    required String depositDesc,
    required String nodeAddress,
    required String toAddress,
    required String amount,
    required String feeAbsolute,
    required String sweep,
  }) {
    final resp = _bitcoin.buildTransaction(
      depositDesc: depositDesc,
      nodeAddress: nodeAddress,
      toAddress: toAddress,
      amount: amount,
      feeAbsolute: feeAbsolute,
      sweep: sweep,
    );
    final data = jsonDecode(resp);
    return data['psbt'] as String;
  }

  @override
  String decodePsbt({required String network, required String psbt}) {
    final resp = _bitcoin.decodePsbt(network: network, psbt: psbt);
    return resp;
  }

  @override
  String signTransaction({
    required String depositDesc,
    required String nodeAddress,
    required String unsignedPSBT,
  }) {
    final resp = _bitcoin.signTransaction(
      depositDesc: depositDesc,
      nodeAddress: nodeAddress,
      unsignedPSBT: unsignedPSBT,
    );
    final data = jsonDecode(resp);
    return data['psbt'] as String;
  }

  @override
  String broadcastTransaction({
    required String depositDesc,
    required String nodeAddress,
    required String signedPSBT,
  }) {
    final resp = _bitcoin.broadcastTransaction(
      depositDesc: depositDesc,
      nodeAddress: nodeAddress,
      signedPSBT: signedPSBT,
    );
    final data = jsonDecode(resp);
    return data['txid'] as String;
  }

  @override
  double estimateNetworkFee({
    required String targetSize,
    required String network,
    required String nodeAddress,
  }) {
    final resp = _bitcoin.estimateNetworkFee(
      targetSize: targetSize,
      network: network,
      nodeAddress: nodeAddress,
    );
    if (resp.startsWith('Error')) throw resp;
    final data = jsonDecode(resp);
    return data['rate'] as double;
  }

  @override
  int getWeight({
    required String depositDesc,
    required String psbt,
  }) {
    final resp = _bitcoin.getWeight(
      depositDesc: depositDesc,
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
  DerivedWallet derivePathStr({required String masterXPriv, required String derivationPath}) {
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
  bool verifySignature(
      {required String signature, required String message, required String pubkey}) {
    // TODO: implement verifySignature
    throw UnimplementedError();
  }

  @override
  XOnlyPair xPrivToEc({required String masterXPriv}) {
    // TODO: implement xPrivToEc
    throw UnimplementedError();
  }
}
