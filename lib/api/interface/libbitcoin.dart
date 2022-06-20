import 'package:libstackmate/libstackmate.dart';

import 'package:sats/model/result.dart';
import 'package:sats/model/transaction.dart';

abstract class IStackMateBitcoin {
  R<Seed> generateMaster({
    required String length,
    required String passphrase,
    required String network,
  });

  R<Seed> importMaster({
    required String mnemonic,
    required String passphrase,
    required String network,
  });

  R<DerivedKeys> deriveHardened({
    required String masterXPriv,
    required String account,
    required String purpose,
  });

  R<String> compile({
    required String policy,
    required String scriptType,
  });

  R<double> estimateNetworkFee({
    required String targetSize,
    required String network,
    required String nodeAddress,
    required String socks5,
  });

  R<int> getWeight({
    required String descriptor,
    required String psbt,
  });

  R<NetworkFees> feeAbsoluteToRate({
    required String feeAbsolute,
    required String weight,
  });

  R<NetworkFees> feeRateToAbsolute({
    required String feeRate,
    required String weight,
  });

  R<int> syncBalance({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
  });

  R<List<Transaction>> getHistory({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
  });

  R<List<UTXO>> getUTXOSet({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
  });

  R<String> getAddress({
    required String descriptor,
    required String index,
  });

  R<PSBT> buildTransaction({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
    required String txOutputs,
    required String feeAbsolute,
    required String policyPath,
    required String sweep,
  });

  R<List<DecodedTxOutput>> decodePsbt({
    required String network,
    required String psbt,
  });

  R<PSBT> signTransaction({
    required String descriptor,
    required String unsignedPSBT,
  });

  Future<R<String>> broadcastTransaction({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
    required String signedPSBT,
  });
  Future<R<String>> broadcastTransactionHex({
    required String descriptor,
    required String nodeAddress,
    required String socks5,
    required String signedHex,
  });
}
