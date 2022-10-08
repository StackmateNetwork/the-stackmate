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
    required this.kind,
    required this.hash,
    required this.nonce,
    required this.signature,
  });

  final int genesis;
  final String giver;
  final String reciever;
  final String kind;
  final String hash;
  final String nonce;
  final String signature;

  @override
  String toString() {
    return '$giver:$reciever:$kind:$nonce';
  }

  bool verify() {
    return false;
  }
}

class PlainPost {
  PlainPost({
    required this.id,
    required this.genesis,
    required this.expiry,
    required this.owner,
    required this.post,
  });

  final String id;
  final int genesis;
  final int expiry;
  final String owner;
  final Post post;
}

class Post {
  Post({
    required this.to,
    required this.payload,
    required this.checksum,
    required this.signature,
  });

  final Recipient to;
  final Payload payload;
  final String checksum;
  final String signature;
}

class Payload {
  Payload({
    required this.kind,
    required this.value,
  });

  final PayloadKind kind;
  final String value;
}

enum PayloadKind {
  preferences,
  message,
  secret,
}

enum RecipientKind {
  direct,
  group,
}

class Recipient {
  Recipient({
    required this.kind,
    required this.value,
  });

  final RecipientKind kind;
  final String value;
}

class Members {
  Members({required this.members});

  List<CypherPostIdentity> members;
}

class AllPosts {
  AllPosts({
    required this.mine,
    required this.others,
  });

  List<PlainPost> mine;
  List<PlainPost> others;
}
