import 'package:sats/model/cypherpost.dart';

final serverId = CypherPostServerIdentity(
  name: 'Cypherpost Lounge',
  pubkey: '448A68554199C47D08FFB10D4B826A3C4655DA4FBFC0E1108A8FD17B',
);

final myId = CypherPostIdentity(
  genesis: 27872872,
  username: 'sm8',
  pubkey: '26A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8',
);

final networks = [
  CypherPostServerIdentity(
    name: 'cypherpostLounge',
    pubkey: '448A68554199C47D08FFB10D4B826A3C4655DA4FBFC0E1108A8FD17B',
  ),
  CypherPostServerIdentity(
    name: 'LightningLounge',
    pubkey: '448A68554199C47D08FFB10D4B826A3C4655DA4FBFC0E1108A8FD1',
  ),
  CypherPostServerIdentity(
    name: 'BitcoinLounge',
    pubkey: '448A68554199C47D08FFB10D4B826A3C4655DA4FBFC1108A8FD17B',
  ),
];

final members = [
  CypherPostIdentity(
    genesis: 1127872872,
    username: 'sm8',
    pubkey: '26A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8',
  ),
  CypherPostIdentity(
    genesis: 1527872872,
    username: 'buff',
    pubkey: 'F9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B1E56FFA',
  ),
  CypherPostIdentity(
    genesis: 1327872872,
    username: 'moses',
    pubkey: '6A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8',
  ),
  CypherPostIdentity(
    genesis: 1327872872,
    username: 'zfr',
    pubkey: 'A448A68554199C55DA4FBFC0E1108A8FD17B10D4B847D08FFB83C46',
  ),
  CypherPostIdentity(
    genesis: 1327872872,
    username: 'hombre',
    pubkey: '17B4408FFB10D4B8268A68554199C47DA3C4655DA4FBFC0E1108A8FD',
  ),
];

final allPostsAsChat = AllChatHistory(
  lastGenesis: 1829380983,
  verified: [
    ChatHistory(
      counterParty: 'F9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B1E56FFA',
      posts: [
        PlainPost(
          id: 's5pA2CD46099227BAD1C14DF4F29EA08646',
          genesis: 1829380983,
          expiry: 0,
          owner: '26A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8',
          post: Post(
            checksum: '3A0B0F5711C266FD67D05E689DDF8544',
            signature:
                'E870B07029BFCDB2D4FBFC0E1108A8FD17B448A655DA4FBFC0E1108A8FD17BCBBAC55A06295CE870B07029BFCDB',
            to: Recipient(
              kind: RecipientKind.direct,
              value: 'F9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B1E56FFA',
            ),
            payload: Payload(
              kind: PayloadKind.message,
              value: 'Hi buff!',
            ),
          ),
        ),
        PlainPost(
          id: 's5p655DA4FBFC0E1108A8FD17B448A6855',
          genesis: 1929380983,
          expiry: 0,
          owner: 'F9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B1E56FFA',
          post: Post(
            checksum: 'A2CD46099227BAD1C14DF4F29EA08646',
            signature:
                'FD17BCBBAC55A06295CE870B07029BFCDBE870B07029BFCDB2D4FBFC0E1108A8FD17B448A655DA4FBFC0E1108A8',
            to: Recipient(
              kind: RecipientKind.direct,
              value: '26A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8',
            ),
            payload: Payload(
              kind: PayloadKind.message,
              value: 'Hi sm8! Lets start a group with moses.',
            ),
          ),
        ),
      ],
    ),
    ChatHistory(
      counterParty: 's5g0E1108A8FD17B448A655D8FD17',
      posts: [
        PlainPost(
          id: 's5pA2CD46099227BAD1C14DF4F29E',
          genesis: 1829380983,
          expiry: 0,
          owner: '26A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8',
          post: Post(
            checksum: '3A0B0F5711C266FD67D05E689DDF8544',
            signature:
                'E870B07029BFCDB2D4FBFC0E1108A8FD17B448A655DA4FBFC0E1108A8FD17BCBBAC55A06295CE870B07029BFCDB',
            to: Recipient(
              kind: RecipientKind.group,
              value: 's5g0E1108A8FD17B448A655D8FD17',
            ),
            payload: Payload(
              kind: PayloadKind.message,
              value: 'Hellow group!',
            ),
          ),
        ),
        PlainPost(
          id: 's5p5CE870B0702D959F29227BAD1C14',
          genesis: 1829380983,
          expiry: 0,
          owner: '6A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8',
          post: Post(
            checksum: 'E1108A8FDBFC0E1108A8FD17B448A',
            signature:
                '55DA4FBFC0E1108A8FDBFC0E1108A8FD17B448A617BCBBAC55A06E870B07029BFCDB2D4F295CE870B07029BFCDB',
            to: Recipient(
              kind: RecipientKind.group,
              value: 's5g0E1108A8FD17B448A655D8FD17',
            ),
            payload: Payload(
              kind: PayloadKind.message,
              value: 'Hellow, I am moses!',
            ),
          ),
        ),
      ],
    )
  ],
  corrupted: [],
);
