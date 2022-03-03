import 'package:dio/dio.dart';
import 'package:sats/model/cypherpost.dart';

abstract class ICypherPostAPI {
  Future<bool> registerIdentity({
    required CypherPostHeader headers,
    required String username,
  });

  Future<List<CypherPostIdentity>> getAllIdentities({
    required String pubkey,
    required String privKey,
  });

  Future<bool> deleteMyIdentity({
    required String pubkey,
    required String privKey,
  });

  Future<List<CypherPostBadge>> getAllBadges({
    required String pubkey,
    required String privKey,
  });

  Future<List<CypherPostBadge>> getMyBadges({
    required String pubkey,
    required String privKey,
  });

  Future<bool> giveBadge({
    required String pubkey,
    required String privKey,
    required String reciever,
    required String badgeType,
  });

  Future<bool> revokeBadge({
    required String pubkey,
    required String privKey,
    required String reciever,
    required String badgeType,
  });

  Future<String> createPost({
    required String pubkey,
    required String privKey,
    required String cypherJson,
    required String derivationScheme,
    required int expiry,
    required String reference,
  });

  Future<bool> setPostVisibility({
    required String pubkey,
    required String privKey,
    required String postId,
    required List<CypherPostDecryptionKey> decryptionKeys,
  });

  Future<List<CypherPost>> getMyPosts({
    required String pubkey,
    required String privKey,
  });

  Future<List<CypherPost>> getPostsForMe({
    required String pubkey,
    required String privKey,
  });

  Future<bool> deletePost({
    required String pubkey,
    required String privKey,
    required String postId,
  });
}
