import 'dart:developer';
import 'package:flutter_test/flutter_test.dart';
import 'package:sats/api/libcp.dart';
import 'package:web_socket_channel/io.dart';

void main() {
  const masterRoot =
      'xprv9s21ZrQH143K2FJMh7DKFuDx9gNMjzA5BPA8NKkrmdF4p8fvpn5PUZsPKwGM1tydUQKQmYZXtgszJPKdiYXwyqAVSZCfRNpYZ7LVaeXJMdG';
  const expectedSocialRoot =
      'xprv9s21ZrQH143K4HgkGgtpYw9Ub8a8ZH33ZTeEJwAnyVvr91Zdkn3xbXxR8jo7Txu3tycENfX6k65SDsz7fS2dXsy5VCM6xLmVwS6ERRwu8rA';
  const expectedMnemonic =
      'permit fuel media speak loud decline color street piano put nothing fog';
  const adminSecret = '9caff0735bc6e80121cedcb98ca51821';
  const kind = 'priv';
  const inviteCode = 'HsmXXpWgS28NQvsgL62sGoQu7mVCfBDX';
  const hostname = 'https://lotr.toma.tech';
  const socks5 = 0;
  const username = 'ika0009';
  const recipient =
      '76015c9bbf0b6d45a953a3ff4dcf6142624481ad747b45e1f775db1e0463c02e';
  const txprv =
      'xprv9s21ZrQH143K43j1kVYWahN4T3aAJNspThDrQxsLoN5Wmu96U6cysT4dVwPpn3ZdK2MKp57axqAXzSDe57pudJjLDh59KzoszabQSFnsGMu';

  late LibCypherpost libcp;

  setUp(() async {
    libcp = LibCypherpost();
  });
  // run admin invite first and update inviteCode
  test('Admin Invite', () async {
    final adminInvite = libcp.adminInvite(
      hostname: hostname,
      socks5: socks5,
      adminSecret: adminSecret,
      kind: kind,
      count: 10,
    );
    print(adminInvite.result!.inviteCode);
  });

  test('Create cp account', () async {
    final root = libcp.createSocialRoot(
      masterRoot: masterRoot,
      account: 0,
    );
    print(root.result!.mnemonic);
    assert(!root.hasError);
    assert(root.result!.xprv == expectedSocialRoot);
    assert(root.result!.mnemonic == expectedMnemonic);

    final joinResult = libcp.joinServer(
      hostname: hostname,
      socks5: socks5,
      socialRoot: expectedSocialRoot,
      username: username,
      inviteCode: inviteCode,
    );

    print(joinResult.result);
    assert(joinResult.result!.inviteCode == inviteCode);
  });

  test('User Priv Invite', () async {
    final privInvite = libcp.privUserInvite(
      hostname: hostname,
      socks5: socks5,
      socialRoot: expectedSocialRoot,
      inviteCode: inviteCode,
    );

    // assert(inviteDetail.result!.count == 1);
  });
  test('Member fx', () async {
    final serverId = libcp.getServerIdentity(
      hostname: hostname,
      socks5: socks5,
      socialRoot: expectedSocialRoot,
    );
    inspect(serverId.result);

    final memberList = libcp.getMembers(
      hostname: hostname,
      socks5: socks5,
      socialRoot: expectedSocialRoot,
    );

    inspect(memberList.result);
  });
  test('Send Post And Get All', () {
    final postId = libcp.sendPost(
      hostname: hostname,
      socks5: socks5,
      socialRoot: expectedSocialRoot,
      index: 1,
      to: 'direct:$recipient',
      kind: 'message',
      value: 'Hi sm8!',
    );

    inspect(postId.result);

    final status = libcp.sendKeys(
      hostname: hostname,
      socks5: socks5,
      socialRoot: expectedSocialRoot,
      index: 1,
      postId: postId.result!.id,
      recipients: recipient,
    );

    inspect(status.result);

    final postsAsChat = libcp.getAllPosts(
      hostname: hostname,
      socks5: socks5,
      socialRoot: txprv,
      genesisFilter: 1672859711718 + 1,
    );

    inspect(postsAsChat.result);
  });
  test('Leave', () async {
    final leaveResult = libcp.leaveServer(
      hostname: hostname,
      socks5: socks5,
      socialRoot: expectedSocialRoot,
    );

    assert(leaveResult.result!.status);
  });
  test('Notification Stream', () async {
    final headerValues = libcp.streamHeaders(
      socialRoot: expectedSocialRoot,
    );

    final Map<String, String> headers = {
      'x-nonce': headerValues.result!.nonce,
      'x-client-pubkey': headerValues.result!.pubkey,
      'x-client-signature': headerValues.result!.signature,
    };

    final channel = IOWebSocketChannel.connect(
      Uri.parse('wss://lotr.toma.tech/api/v3/notifications'),
      headers: headers,
    );

    channel.stream.listen((message) {
      print(message);
    });

    await Future.delayed(const Duration(seconds: 3));
  });
}
