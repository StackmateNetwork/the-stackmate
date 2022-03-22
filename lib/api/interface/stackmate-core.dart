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