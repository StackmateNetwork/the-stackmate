class CypherPostHeader {
  CypherPostHeader({
    required this.pubKey,
    required this.nonce,
    required this.signature,
  });

  final String pubKey;
  final int nonce;
  final String signature;

  Map<String, dynamic> toDict() {
    return {
      'X-Client-Signature': signature,
      'X-Nonce': nonce,
      'X-Client-Pubkey': pubKey,
    };
  }
}

class CypherPostIdentity {
  CypherPostIdentity({
    required this.genesis,
    required this.username,
    required this.pubkey,
  });

  final int genesis;
  final String username;
  final String pubkey;
}

class CypherPostBadge {
  CypherPostBadge({
    required this.genesis,
    required this.giver,
    required this.reciever,
    required this.type,
    required this.hash,
    required this.nonce,
    required this.signature,
  });

  final int genesis;
  final String giver;
  final String reciever;
  final String type;
  final String hash;
  final String nonce;
  final String signature;
}

class CypherPostDecryptionKey {
  CypherPostDecryptionKey({
    required this.reciever,
    required this.decryptionKey,
  });

  final String reciever;
  final String decryptionKey;
}

class CypherPost {
  CypherPost({
    required this.id,
    required this.reference,
    required this.genesis,
    required this.expiry,
    required this.owner,
    required this.cypherJson,
    required this.derivationScheme,
    required this.decryptionKey,
  });

  final String id;
  final String reference;
  final int genesis;
  final int expiry;
  final String owner;
  final String cypherJson;
  final String derivationScheme;
  final String? decryptionKey;
}

//  id: string;
//   reference: string;
//   genesis: number;
//   expiry: number;
//   owner: string;
//   cypher_json: string;
//   derivation_scheme: string;
//   decryption_key?: string;
