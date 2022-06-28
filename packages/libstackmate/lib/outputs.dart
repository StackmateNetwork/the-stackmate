// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

class SMError {
  const SMError(this.kind, this.message);
  factory SMError.fromJson(String data) {
    final json = jsonDecode(data);
    return SMError(
      json['kind'] as String,
      json['message'] as String,
    );
  }
  final String kind;
  final String message;

  String get oneliner => '$kind:$message';
}

class PSBT {
  // ignore: avoid_positional_boolean_parameters
  const PSBT(this.psbt, this.isFinalized);
  factory PSBT.fromJson(String data) {
    final json = jsonDecode(data);
    return PSBT(
      json['psbt'] as String,
      json['is_finalized'] as bool,
    );
  }
  final String psbt;
  final bool isFinalized;
}

class Seed {
  const Seed(this.mnemonic, this.fingerprint, this.xprv);
  factory Seed.fromJson(String data) {
    final json = jsonDecode(data);
    return Seed(
      json['mnemonic'] as String,
      json['fingerprint'] as String,
      json['xprv'] as String,
    );
  }
  final String mnemonic;
  final String fingerprint;
  final String xprv;

  List<String> get neuList => mnemonic.split(' ');
}

class XOnlyPair {
  XOnlyPair(this.privKey, this.pubKey);
  final String privKey;
  final String pubKey;
}

class DerivedKeys {
  const DerivedKeys(
    this.fingerPrint,
    this.hardenedPath,
    this.xprv,
    this.xpub,
  );
  factory DerivedKeys.fromJson(String data) {
    final json = jsonDecode(data);
    return DerivedKeys(
      json['fingerprint'] as String,
      json['hardened_path'] as String,
      json['xprv'] as String,
      json['xpub'] as String,
    );
  }
  final String fingerPrint;
  final String hardenedPath;
  final String xprv;
  final String xpub;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DerivedKeys &&
          runtimeType == other.runtimeType &&
          xprv == other.xprv;

  @override
  int get hashCode => xprv.hashCode;

  String get fullXPub =>
      '[$fingerPrint/${hardenedPath.replaceFirst('m/', '')}]$xpub';
  String get fullXPrv =>
      '[$fingerPrint/${hardenedPath.replaceFirst('m/', '')}]$xprv';
}

class NetworkFees {
  const NetworkFees(
    this.rate,
    this.absolute,
  );

  factory NetworkFees.fromJson(String data) {
    final json = jsonDecode(data);
    return NetworkFees(
      json['rate'] as double,
      json['absolute'] as int,
    );
  }

  final double rate;
  final int absolute;
}

// class Decode {
//   const Decode(this.miner, this.amount);
//   factory Decode.fromJson(String data) {
//     final json = jsonDecode(data)['outputs']['outputs'];

//     final List<DecodedTxOutput> decoded = [];
//     for (final out in json) {
//       decoded.add(DecodedTxOutput.fromJson(out as Map<String, dynamic>));
//     }

//     return Decode(
//         // json['policy'] as String,
//         // json['descriptor'] as String,
//         );
//   }

//   final int miner;
//   final int amount;
// }

class Descriptor {
  const Descriptor(this.policy, this.descriptor);
  factory Descriptor.fromJson(String data) {
    final json = jsonDecode(data);
    return Descriptor(
      json['policy'] as String,
      json['descriptor'] as String,
    );
  }

  final String policy;
  final String descriptor;
}

class DecodedTxOutput {
  const DecodedTxOutput(this.value, this.to);
  factory DecodedTxOutput.fromJson(Map<String, dynamic> json) {
    return DecodedTxOutput(
      json['value'] as int,
      json['to'] as String,
    );
  }

  final int value;
  final String to;
}

class UTXO {
  const UTXO(
    this.txid,
    this.vout,
    this.value,
    this.scriptPubkey,
    this.keychainKind,
  );
  factory UTXO.fromJson(Map<String, dynamic> json) {
    return UTXO(
      json['txid'] as String,
      json['vout'] as int,
      json['value'] as int,
      json['script_pubkey'] as String,
      json['keychain_kind'] as String,
    );
  }
  final String txid;
  final int vout;
  final int value;
  final String scriptPubkey;
  final String keychainKind;
}
