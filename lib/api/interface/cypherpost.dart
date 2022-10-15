// import 'package:bitcoin/bitcoin.dart';
// import 'package:sats/model/cypherpost.dart';
// import 'package:sats/model/result.dart';

// abstract class ICypherPostAPI {
//   Future<R<bool>> registerIdentity({
//     required CypherPostHeader headers,
//     required String username,
//   });

//   Future<R<List<CypherPostIdentity>>> getAllIdentities({
//     required XOnlyPair keyPair,
//   });

//   Future<R<bool>> deleteMyIdentity({
//     required XOnlyPair keyPair,
//   });

//   Future<R<List<CypherPostBadge>>> getAllBadges({
//     required XOnlyPair keyPair,
//   });

//   Future<R<List<CypherPostBadge>>> getMyBadges({
//     required XOnlyPair keyPair,
//   });

//   Future<R<bool>> giveBadge({
//     required XOnlyPair keyPair,
//     required String reciever,
//     required String badgeType,
//   });

//   Future<R<bool>> revokeBadge({
//     required XOnlyPair keyPair,
//     required String reciever,
//     required String badgeType,
//   });

//   Future<R<String>> createPost({
//     required XOnlyPair keyPair,
//     required String cypherJson,
//     required String derivationScheme,
//     required int expiry,
//     required String reference,
//   });

//   Future<R<bool>> setPostVisibility({
//     required XOnlyPair keyPair,
//     required String postId,
//     required List<CypherPostDecryptionKey> decryptionKeys,
//   });

//   Future<R<List<CypherPost>>> getMyPosts({
//     required XOnlyPair keyPair,
//   });

//   Future<R<List<CypherPost>>> getPostsForMe({
//     required XOnlyPair keyPair,
//   });

//   Future<R<bool>> deletePost({
//     required XOnlyPair keyPair,
//     required String postId,
//   });
// }
