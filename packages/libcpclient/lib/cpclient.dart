import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:libcpclient/inputs.dart';
export 'package:libcpclient/outputs.dart';

class LibCPClientFFI {
  LibCPClientFFI({required this.binary});

  final DynamicLibrary binary;

  String createSocialRoot({
    required String masterRoot,
    required int account,
  }) {
    final func = binary
        .lookupFunction<CreateSocialT, CreateSocialT>('create_social_root');
    final resp = func(
      masterRoot.toNativeUtf8(),
      account.toString().toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String getServerIdentity({
    required String hostname,
    required int socks5,
    required String socialRoot,
  }) {
    final func = binary.lookupFunction<ServerIdT, ServerIdT>('server_identity');
    final resp = func(
      hostname.toNativeUtf8(),
      socks5.toString().toNativeUtf8(),
      socialRoot.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String adminInvite({
    required String hostname,
    required int socks5,
    required String adminSecret,
    required String kind,
    required int count,
  }) {
    final func =
        binary.lookupFunction<AdminInviteT, AdminInviteT>('admin_invite');
    final resp = func(
      hostname.toNativeUtf8(),
      socks5.toString().toNativeUtf8(),
      adminSecret.toNativeUtf8(),
      kind.toNativeUtf8(),
      count.toString().toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String privUserInvite({
    required String hostname,
    required int socks5,
    required String socialRoot,
    required String inviteCode,
  }) {
    final func = binary.lookupFunction<InviteT, InviteT>('priv_user_invite');
    final resp = func(
      hostname.toNativeUtf8(),
      socks5.toString().toNativeUtf8(),
      socialRoot.toNativeUtf8(),
      inviteCode.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String userInviteDetail({
    required String hostname,
    required int socks5,
    required String socialRoot,
    required String inviteCode,
  }) {
    final func = binary.lookupFunction<InviteT, InviteT>('user_invite_detail');
    final resp = func(
      hostname.toNativeUtf8(),
      socks5.toString().toNativeUtf8(),
      socialRoot.toNativeUtf8(),
      inviteCode.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String getMembers({
    required String hostname,
    required int socks5,
    required String socialRoot,
  }) {
    final func = binary.lookupFunction<MembersT, MembersT>('get_members');
    final resp = func(
      hostname.toNativeUtf8(),
      socks5.toString().toNativeUtf8(),
      socialRoot.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String joinServer({
    required String hostname,
    required int socks5,
    required String socialRoot,
    required String username,
    required String inviteCode,
  }) {
    final func = binary.lookupFunction<JoinT, JoinT>('join');
    final resp = func(
      hostname.toNativeUtf8(),
      socks5.toString().toNativeUtf8(),
      socialRoot.toNativeUtf8(),
      username.toNativeUtf8(),
      inviteCode.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String leaveServer({
    required String hostname,
    required int socks5,
    required String socialRoot,
  }) {
    final func = binary.lookupFunction<LeaveT, LeaveT>('leave');
    final resp = func(
      hostname.toNativeUtf8(),
      socks5.toString().toNativeUtf8(),
      socialRoot.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String sendPost({
    required String hostname,
    required int socks5,
    required String socialRoot,
    required int index,
    required String to,
    required String kind,
    required String value,
  }) {
    final func = binary.lookupFunction<SendPostT, SendPostT>('send_post');
    final resp = func(
      hostname.toNativeUtf8(),
      socks5.toString().toNativeUtf8(),
      socialRoot.toNativeUtf8(),
      index.toString().toNativeUtf8(),
      to.toNativeUtf8(),
      kind.toNativeUtf8(),
      value.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String sendKeys({
    required String hostname,
    required int socks5,
    required String socialRoot,
    required int index,
    required String postId,
    required String recipients,
  }) {
    final func = binary.lookupFunction<SendKeysT, SendKeysT>('send_keys');
    final resp = func(
      hostname.toNativeUtf8(),
      socks5.toString().toNativeUtf8(),
      socialRoot.toNativeUtf8(),
      index.toString().toNativeUtf8(),
      postId.toNativeUtf8(),
      recipients.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String getOnePost({
    required String hostname,
    required int socks5,
    required String socialRoot,
    required String postId,
  }) {
    final func = binary.lookupFunction<OnePostT, OnePostT>('get_one_post');
    final resp = func(
      hostname.toNativeUtf8(),
      socks5.toString().toNativeUtf8(),
      socialRoot.toNativeUtf8(),
      postId.toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String getAllPosts({
    required String hostname,
    required int socks5,
    required String socialRoot,
    required int genesisFilter,
  }) {
    final func = binary.lookupFunction<AllPostsT, AllPostsT>('get_all_posts');
    final resp = func(
      hostname.toNativeUtf8(),
      socks5.toString().toNativeUtf8(),
      socialRoot.toNativeUtf8(),
      genesisFilter.toString().toNativeUtf8(),
    ).toDartString();
    return resp;
  }

  String lastIndex({
    required String hostname,
    required int socks5,
    required String socialRoot,
  }) {
    final func = binary.lookupFunction<IndexT, IndexT>('last_index');
    final resp = func(
      hostname.toNativeUtf8(),
      socks5.toString().toNativeUtf8(),
      socialRoot.toNativeUtf8(),
    ).toDartString();
    return resp;
  }
}
