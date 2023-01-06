import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:libcpclient/cpclient.dart';
import 'package:sats/api/interface/libcp.dart';
import 'package:sats/model/result.dart';

class LibCypherpost implements ICypherpost {
  LibCypherpost() {
    _libcp = LibCPClientFFI(
      binary: Platform.isAndroid
          ? DynamicLibrary.open('libcpclient.so')
          : Platform.isMacOS
              ? DynamicLibrary.open(
                  'packages/libcpclient/macos/x86_64/libcpclient.dylib',
                )
              : DynamicLibrary.open(
                  'packages/libcpclient/linux/x86_64/libcpclient.so',
                ),
    );
  }

  late LibCPClientFFI _libcp;

  @override
  R<SocialRoot> createSocialRoot({
    required String masterRoot,
    required int account,
  }) {
    final resp = _libcp.createSocialRoot(
      masterRoot: masterRoot,
      account: account,
    );

    if (resp.contains('error')) {
      return R(error: SMError.fromJson(resp).error);
    }

    return R(result: SocialRoot.fromJson(resp));
  }

  @override
  R<ServerIdentity> getServerIdentity({
    required String hostname,
    required int socks5,
    required String socialRoot,
  }) {
    print(hostname);
    print(socialRoot);

    final resp = _libcp.getServerIdentity(
      hostname: hostname,
      socks5: socks5,
      socialRoot: socialRoot,
    );

    if (resp.contains('error')) {
      return R(error: SMError.fromJson(resp).error);
    } else
      return R(result: ServerIdentity.fromJson(resp));
  }

  @override
  R<Invitation> adminInvite({
    required String hostname,
    required int socks5,
    required String adminSecret,
    required String kind,
    required int count,
  }) {
    final resp = _libcp.adminInvite(
      hostname: hostname,
      socks5: socks5,
      adminSecret: adminSecret,
      kind: kind,
      count: count,
    );

    if (resp.contains('error')) {
      return R(error: SMError.fromJson(resp).error);
    } else
      return R(result: Invitation.fromJson(resp));
  }

  @override
  R<Invitation> privUserInvite({
    required String hostname,
    required int socks5,
    required String socialRoot,
    required String inviteCode,
  }) {
    final resp = _libcp.privUserInvite(
      hostname: hostname,
      socks5: socks5,
      socialRoot: socialRoot,
      inviteCode: inviteCode,
    );

    if (resp.contains('error')) {
      return R(error: SMError.fromJson(resp).error);
    } else
      return R(result: Invitation.fromJson(resp));
  }

  @override
  R<List<MemberIdentity>> getMembers({
    required String hostname,
    required int socks5,
    required String socialRoot,
  }) {
    final resp = _libcp.getMembers(
      hostname: hostname,
      socks5: socks5,
      socialRoot: socialRoot,
    );

    if (resp.contains('error')) {
      return R(error: SMError.fromJson(resp).error);
    }

    final json = jsonDecode(resp);
    final List<MemberIdentity> members = [];
    for (final t in json['identities'] as List) {
      final member = MemberIdentity.fromJson(t as Map<String, dynamic>);
      members.add(member);
    }

    return R(result: members);
  }

  @override
  R<InvitationDetail> joinServer({
    required String hostname,
    required int socks5,
    required String socialRoot,
    required String username,
    required String inviteCode,
  }) {
    final resp = _libcp.joinServer(
      hostname: hostname,
      socks5: socks5,
      socialRoot: socialRoot,
      username: username,
      inviteCode: inviteCode,
    );

    if (resp.contains('error')) {
      return R(error: SMError.fromJson(resp).error);
    } else
      return R(result: InvitationDetail.fromJson(resp));
  }

  @override
  R<InvitationDetail> selfInviteCode({
    required String hostname,
    required int socks5,
    required String socialRoot,
  }) {
    final resp = _libcp.selfInvitation(
      hostname: hostname,
      socks5: socks5,
      socialRoot: socialRoot,
    );

    if (resp.contains('error')) {
      return R(error: SMError.fromJson(resp).error);
    } else
      return R(result: InvitationDetail.fromJson(resp));
  }

  @override
  R<ServerStatus> leaveServer({
    required String hostname,
    required int socks5,
    required String socialRoot,
  }) {
    final resp = _libcp.leaveServer(
      hostname: hostname,
      socks5: socks5,
      socialRoot: socialRoot,
    );

    if (resp.contains('error')) {
      return R(error: SMError.fromJson(resp).error);
    }

    return R(result: ServerStatus.fromJson(resp));
  }

  @override
  R<PostId> sendPost({
    required String hostname,
    required int socks5,
    required String socialRoot,
    required int index,
    required String to,
    required String kind,
    required String value,
  }) {
    final resp = _libcp.sendPost(
      hostname: hostname,
      socks5: socks5,
      socialRoot: socialRoot,
      index: index,
      to: to,
      kind: kind,
      value: value,
    );

    if (resp.contains('error')) {
      return R(error: SMError.fromJson(resp).error);
    }

    return R(result: PostId.fromJson(resp));
  }

  @override
  R<ServerStatus> sendKeys({
    required String hostname,
    required int socks5,
    required String socialRoot,
    required int index,
    required String postId,
    required String recipients,
  }) {
    final resp = _libcp.sendKeys(
      hostname: hostname,
      socks5: socks5,
      socialRoot: socialRoot,
      index: index,
      postId: postId,
      recipients: recipients,
    );

    if (resp.contains('error')) {
      return R(error: SMError.fromJson(resp).error);
    }

    return R(result: ServerStatus.fromJson(resp));
  }

  @override
  R<CompletePost> getOnePost({
    required String hostname,
    required int socks5,
    required String socialRoot,
    required String postId,
  }) {
    final resp = _libcp.getOnePost(
      hostname: hostname,
      socks5: socks5,
      socialRoot: socialRoot,
      postId: postId,
    );

    if (resp.contains('error')) {
      return R(error: SMError.fromJson(resp).error);
    }

    return R(result: CompletePost.fromJson(resp as Map<String, dynamic>));
  }

  @override
  R<SortedPosts> getAllPosts({
    required String hostname,
    required int socks5,
    required String socialRoot,
    required int genesisFilter,
  }) {
    final resp = _libcp.getAllPosts(
      hostname: hostname,
      socks5: socks5,
      socialRoot: socialRoot,
      genesisFilter: genesisFilter,
    );

    if (resp.contains('error')) {
      return R(error: SMError.fromJson(resp).error);
    }

    final json = jsonDecode(resp);

    return R(result: SortedPosts.fromJson(json as Map<String, dynamic>));
  }

  @override
  R<StreamHeaders> streamHeaders({
    required String socialRoot,
  }) {
    final resp = _libcp.streamHeaders(
      socialRoot: socialRoot,
    );

    if (resp.contains('error')) {
      return R(error: SMError.fromJson(resp).error);
    }

    return R(result: StreamHeaders.fromJson(resp));
  }
}
