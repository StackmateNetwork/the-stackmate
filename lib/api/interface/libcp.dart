import 'package:libcpclient/cpclient.dart';

import 'package:sats/model/result.dart';

abstract class ICypherpost {
  R<SocialRoot> createSocialRoot({
    required String masterRoot,
    required int account,
  });

  R<ServerIdentity> getServerIdentity({
    required String hostname,
    required int socks5,
    required String socialRoot,
  });

  R<Invitation> adminInvite({
    required String hostname,
    required int socks5,
    required String adminSecret,
    required String kind,
    required int count,
  });

  R<Invitation> privUserInvite({
    required String hostname,
    required int socks5,
    required String socialRoot,
    required String inviteCode,
  });

  R<List<MemberIdentity>> getMembers({
    required String hostname,
    required int socks5,
    required String socialRoot,
  });

  R<ServerStatus> joinServer({
    required String hostname,
    required int socks5,
    required String socialRoot,
    required String username,
    required String inviteCode,
  });

  R<ServerStatus> leaveServer({
    required String hostname,
    required int socks5,
    required String socialRoot,
  });

  // R<PostId> sendPost({
  //   required String hostname,
  //   required int socks5,
  //   required String socialRoot,
  //   required int index,
  //   required String to,
  //   required String kind,
  //   required String value,
  // });

  // R<ServerStatus> sendKeys({
  //   required String hostname,
  //   required int socks5,
  //   required String socialRoot,
  //   required int index,
  //   required String postId,
  //   required String recipients,
  // });

  // R<CompletePost> getOnePost({
  //   required String hostname,
  //   required int socks5,
  //   required String socialRoot,
  //   required String postId,
  // });

  // R<List<CompletePost>> getAllPosts({
  //   required String hostname,
  //   required int socks5,
  //   required String socialRoot,
  //   required int genesisFilter,
  // }) ;

  // R<DerivationIndex> lastIndex({
  //   required String hostname,
  //   required int socks5,
  //   required String socialRoot,
  // });
}
