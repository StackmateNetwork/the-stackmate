import 'package:bitcoin/bitcoin.dart';
import 'package:sats/model/cypherpost.dart';

abstract class ICypherPostAPI {
  Future<bool> registerIdentity({
    required CypherPostHeader headers,
    required String username,
  });

  Future<List<CypherPostIdentity>> getAllIdentities({
    required XOnlyPair keyPair,
  });

  Future<bool> deleteMyIdentity({
    required XOnlyPair keyPair,
  });

  Future<List<CypherPostBadge>> getAllBadges({
    required XOnlyPair keyPair,
  });

  Future<List<CypherPostBadge>> getMyBadges({
    required XOnlyPair keyPair,
  });

  Future<bool> giveBadge({
    required XOnlyPair keyPair,
    required String reciever,
    required String badgeType,
  });

  Future<bool> revokeBadge({
    required XOnlyPair keyPair,
    required String reciever,
    required String badgeType,
  });

  Future<String> createPost({
    required XOnlyPair keyPair,
    required String cypherJson,
    required String derivationScheme,
    required int expiry,
    required String reference,
  });

  Future<bool> setPostVisibility({
    required XOnlyPair keyPair,
    required String postId,
    required List<CypherPostDecryptionKey> decryptionKeys,
  });

  Future<List<CypherPost>> getMyPosts({
    required XOnlyPair keyPair,
  });

  Future<List<CypherPost>> getPostsForMe({
    required XOnlyPair keyPair,
  });

  Future<bool> deletePost({
    required XOnlyPair keyPair,
    required String postId,
  });
}
