import 'dart:developer';
import 'package:flutter_test/flutter_test.dart';
import 'package:sats/api/libcp.dart';

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
  test('Leave', () async {
    final leaveResult = libcp.leaveServer(
      hostname: hostname,
      socks5: socks5,
      socialRoot: expectedSocialRoot,
    );

    assert(leaveResult.result!.status);
  });
}
