// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

class SMError {
  const SMError(
    this.kind,
    this.error,
  );
  factory SMError.fromJson(String data) {
    final json = jsonDecode(data);
    return SMError(
      json['kind'] as String,
      json['error'] as String,
    );
  }
  final String kind;
  final String error;

  String get oneliner => '$kind:$error';
}

class SocialRoot {
  const SocialRoot(
    this.xprv,
    this.mnemonic,
    this.pubkey,
  );
  factory SocialRoot.fromJson(String data) {
    final json = jsonDecode(data);
    return SocialRoot(
      json['xprv'] as String,
      json['mnemonic'] as String,
      json['pubkey'] as String,
    );
  }
  final String xprv;
  final String mnemonic;
  final String pubkey;
}

class ServerIdentity {
  const ServerIdentity(
    this.name,
    this.kind,
    this.pubkey,
  );
  factory ServerIdentity.fromJson(String data) {
    final json = jsonDecode(data);
    return ServerIdentity(
      json['name'] as String,
      json['kind'] as String,
      json['pubkey'] as String,
    );
  }
  final String name;
  final String kind;
  final String pubkey;
}

class Invitation {
  const Invitation(this.inviteCode);
  factory Invitation.fromJson(String data) {
    final json = jsonDecode(data);
    return Invitation(
      json['invite_code'] as String,
    );
  }
  final String inviteCode;
}

class InvitationDetail {
  const InvitationDetail(
    this.genesis,
    this.inviteCode,
    this.claimedBy,
    this.createdBy,
    this.status,
    this.kind,
    this.count,
  );
  factory InvitationDetail.fromJson(String data) {
    final json = jsonDecode(data);
    return InvitationDetail(
      json['genesis'] as int,
      json['invite_code'] as String,
      (json['claimed_by'] != null) ? json['claimed_by'] as String : 'None',
      (json['created_by'] != null) ? json['created_by'] as String : 'None',
      json['status'] as String,
      json['kind'] as String,
      json['count'] as int,
    );
  }
  final int genesis;
  final String inviteCode;
  final String kind;
  final String status;
  final String claimedBy;
  final String createdBy;
  final int count;
}

class MemberIdentity {
  const MemberIdentity(
    this.username,
    this.pubkey,
  );
  factory MemberIdentity.fromJson(Map<String, dynamic> json) {
    return MemberIdentity(
      json['username'] as String,
      json['pubkey'] as String,
    );
  }
  final String username;
  final String pubkey;
}

class ServerStatus {
  const ServerStatus(this.status);
  factory ServerStatus.fromJson(String data) {
    final json = jsonDecode(data);
    return ServerStatus(
      json['status'] as bool,
    );
  }
  final bool status;
}

class PostId {
  const PostId(this.id);
  factory PostId.fromJson(String data) {
    final json = jsonDecode(data);
    return PostId(
      json['id'] as String,
    );
  }
  final String id;
}

// enum RecipientKind { direct, group }
// To parse this JSON data, do
//
//     final welcome3 = welcome3FromJson(jsonString);

class SortedPosts {
  SortedPosts({
    this.verified,
    this.corrupted,
    this.latestGenesis,
  });

  SortedPosts.fromJson(Map<String, dynamic> json) {
    verified = (json['verified'] as List?)
        ?.map((dynamic e) => Verified.fromJson(e as Map<String, dynamic>))
        .toList();
    corrupted =
        (json['corrupted'] as List?)?.map((dynamic e) => e as String).toList();
    latestGenesis = json['latest_genesis'] as int?;
  }
  List<Verified>? verified;
  List<String>? corrupted;
  int? latestGenesis;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['verified'] = verified?.map((e) => e.toJson()).toList();
    json['corrupted'] = corrupted;
    json['latest_genesis'] = latestGenesis;
    return json;
  }
}

class Verified {
  Verified({
    this.counterParty,
    this.posts,
  });

  Verified.fromJson(Map<String, dynamic> json) {
    counterParty = json['counter_party'] as String?;
    posts = (json['posts'] as List?)
        ?.map((dynamic e) => CompletePost.fromJson(e as Map<String, dynamic>))
        .toList();
  }
  String? counterParty;
  List<CompletePost>? posts;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['counter_party'] = counterParty;
    json['posts'] = posts?.map((e) => e.toJson()).toList();
    return json;
  }
}

class CompletePost {
  CompletePost({
    required this.id,
    required this.genesis,
    required this.expiry,
    required this.owner,
    required this.post,
  });

  CompletePost.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    genesis = json['genesis'] as int;
    expiry = json['expiry'] as int;
    owner = json['owner'] as String;
    post = Post.fromJson(json['post'] as Map<String, dynamic>);
  }
  late String id;
  late int genesis;
  late int expiry;
  late String owner;
  late Post post;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['genesis'] = genesis;
    json['expiry'] = expiry;
    json['owner'] = owner;
    json['post'] = post.toJson();
    return json;
  }
}

class Post {
  Post({
    this.to,
    this.payload,
    this.checksum,
    this.signature,
  });

  Post.fromJson(Map<String, dynamic> json) {
    to = (json['to'] as Map<String, dynamic>?) != null
        ? To.fromJson(json['to'] as Map<String, dynamic>)
        : null;
    payload = (json['payload'] as Map<String, dynamic>?) != null
        ? Payload.fromJson(json['payload'] as Map<String, dynamic>)
        : null;
    checksum = json['checksum'] as String?;
    signature = json['signature'] as String?;
  }
  To? to;
  Payload? payload;
  String? checksum;
  String? signature;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['to'] = to?.toJson();
    json['payload'] = payload?.toJson();
    json['checksum'] = checksum;
    json['signature'] = signature;
    return json;
  }
}

class To {
  To({
    required this.kind,
    required this.value,
  });

  To.fromJson(Map<String, dynamic> json) {
    kind = json['kind'] as String;
    value = json['value'] as String;
  }
  late String kind;
  late String value;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['kind'] = kind;
    json['value'] = value;
    return json;
  }
}

class Payload {
  Payload({
    required this.kind,
    required this.value,
  });

  Payload.fromJson(Map<String, dynamic> json) {
    kind = json['kind'] as String;
    value = json['value'] as String;
  }
  late String kind;
  late String value;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['kind'] = kind;
    json['value'] = value;
    return json;
  }
}

class DerivationIndex {
  const DerivationIndex(this.lastUsed);
  factory DerivationIndex.fromJson(String data) {
    final json = jsonDecode(data);
    return DerivationIndex(
      json['last_used'] as int,
    );
  }
  final int lastUsed;
}
