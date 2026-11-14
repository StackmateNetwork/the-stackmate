// Value types returned by the wallet engine (lib/api/libbitcoin.dart).

import 'dart:convert';

class SMError {
  const SMError(this.kind, this.message);
  factory SMError.fromJson(String data) {
    final json = jsonDecode(data) as Map<String, dynamic>;
    return SMError(json['kind'] as String, json['message'] as String);
  }
  final String kind;
  final String message;

  String get oneliner => '$kind:$message';

  String toJson() => jsonEncode({'kind': kind, 'message': message});
}

class PSBT {
  const PSBT(this.psbt, this.isFinalized);
  final String psbt;
  final bool isFinalized;
}

class Seed {
  const Seed(this.mnemonic, this.fingerprint, this.xprv);
  final String mnemonic;
  final String fingerprint;
  final String xprv;

  List<String> get neuList => mnemonic.split(' ');
}

class DerivedKeys {
  const DerivedKeys(this.fingerPrint, this.hardenedPath, this.xprv, this.xpub);
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
  const NetworkFees(this.rate, this.absolute);

  final double rate;
  final int absolute;
}

class DecodedTxOutput {
  const DecodedTxOutput(this.value, this.to);

  final int value;
  final String to;
}

class Address {
  const Address(this.address, this.index);
  final String address;
  final String index;
}
