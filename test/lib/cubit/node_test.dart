import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/model/node.dart';

import 'package:sats/model/result.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:test/test.dart';
import 'package:sats/pkg/storage.dart';

class _MockStorage extends Mock implements IStorage {}

class _MockNode extends Mock implements Node {}

main() {
  group('nodeCubit', () {
    late IStorage _storage;
    late Node mockNode;
    late NodeAddressCubit nodeAddressCubit;

    setUp(() {
      _storage = _MockStorage();
      mockNode = _MockNode();
      nodeAddressCubit = NodeAddressCubit(_storage);

      // when(
      //   _storage.getFirstItem<Node>(StoreKeys.Node.name),
      // ).thenAnswer((_) => R(result: mockNode));
    });

    tearDown(() {});
    blocTest<NodeAddressCubit, NodeAddressState>(
      'Should init node address',
      // setUp: () => when(
      //   _storage.getFirstItem<Node>(StoreKeys.Node.name),
      // ).thenAnswer((_) => R(result: mockNode)),
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
      verify: (cubit) => [
        verify(_storage.getFirstItem<Node>(StoreKeys.Node.name)).called(1),
      ],
    );
  });
}
