import 'package:bitcoin/bitcoin.dart';
import 'package:sats/model/result.dart';
import 'package:sats/model/transaction.dart';

abstract class IStackMateCore {
  R<DerivedWallet> derivePathStr({
    required String masterXPriv,
    required String derivationPath,
  });

  R<XOnlyPair> xPrivToEc({required String masterXPriv});

  R<String> sharedSecret({
    required String localPriv,
    required String remotePub,
  });

  R<String> signMessage({
    required String message,
    required String secKey,
  });

  R<bool> verifySignature({
    required String signature,
    required String message,
    required String pubkey,
  });

  R<Nmeu> generateMaster({
    required String length,
    required String passphrase,
    required String network,
  });

  R<Nmeu> importMaster({
    required String mnemonic,
    required String passphrase,
    required String network,
  });

  R<DerivedWallet> deriveHardened({
    required String masterXPriv,
    required String account,
    required String purpose,
  });

  R<Compile> compile({
    required String policy,
    required String scriptType,
  });

  R<double> estimateNetworkFee({
    required String targetSize,
    required String network,
    required String nodeAddress,
  });

  R<int> getWeight({
    required String depositDesc,
    required String psbt,
  });

  R<AbsoluteFees> feeAbsoluteToRate({
    required String feeAbsolute,
    required String weight,
  });

  R<AbsoluteFees> feeRateToAbsolute({
    required String feeRate,
    required String weight,
  });

  R<int> syncBalance({
    required String depositDesc,
    required String nodeAddress,
  });

  R<List<Transaction>> getHistory({
    required String depositDesc,
    required String nodeAddress,
  });

  R<String> getAddress({
    required String depositDesc,
    required String nodeAddress,
    required String index,
  });

  R<String> buildTransaction({
    required String depositDesc,
    required String nodeAddress,
    required String toAddress,
    required String amount,
    required String feeAbsolute,
    required String sweep,
  });

  R<String> decodePsbt({
    required String network,
    required String psbt,
  });

  R<String> signTransaction({
    required String depositDesc,
    required String nodeAddress,
    required String unsignedPSBT,
  });

  R<String> broadcastTransaction({
    required String depositDesc,
    required String nodeAddress,
    required String signedPSBT,
  });

  R<int> getHeight({
    required String network,
    required String nodeAddress,
  });

  R<int> daysToBlocks({required String days});
}
