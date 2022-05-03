import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/model/node.dart';

import 'package:sats/model/result.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:test/test.dart';
import 'package:sats/pkg/storage.dart';

class _MockStorage extends Mock implements IStorage {}

main() {
  group('nodeCubit', () {
    late IStorage storage;
    late NodeAddressCubit nodeAddressCubit;

    setUp(() {
      storage = _MockStorage();
      nodeAddressCubit = NodeAddressCubit(storage);
    });

    tearDown(() {});
    blocTest<NodeAddressCubit, NodeAddressState>(
      'Should init node address',
      build: () => nodeAddressCubit,
      act: (cubit) {
        cubit.init();
      },
      expect: () => <NodeAddressState>[
        const NodeAddressState(
          address: 'electrum.blockstream.info',
          port: '60002',
        ),
      ],
      // verify: (cubit) => [
      //       verify(storage.getFirstItem<Node>(StoreKeys.Node.name)).called(1),
      //     ]);
    );
  });
}
