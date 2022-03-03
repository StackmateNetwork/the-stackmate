import 'dart:convert';

class Nmeu {
  const Nmeu(this.mnemonic, this.fingerprint, this.xprv);
  factory Nmeu.fromJson(String data) {
    final json = jsonDecode(data);
    return Nmeu(
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

class DerivedWallet {
  const DerivedWallet(
    this.fingerPrint,
    this.hardenedPath,
    this.xprv,
    this.xpub,
  );
  factory DerivedWallet.fromJson(String data) {
    final json = jsonDecode(data);
    return DerivedWallet(
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
}

class AbsoluteFees {
  const AbsoluteFees(
    this.rate,
    this.absolute,
  );

  factory AbsoluteFees.fromJson(String data) {
    final json = jsonDecode(data);
    return AbsoluteFees(
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

class Compile {
  const Compile(this.policy, this.descriptor);
  factory Compile.fromJson(String data) {
    final json = jsonDecode(data);
    return Compile(
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
