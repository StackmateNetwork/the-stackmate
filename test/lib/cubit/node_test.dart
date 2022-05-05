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

    setUp(() async {
      _storage = _MockStorage();
      mockNode = _MockNode();
      when(_storage.getFirstItem<Node>(StoreKeys.Node.name))
          .thenAnswer((_) => R(result: mockNode));
      nodeAddressCubit = NodeAddressCubit(_storage);
    });

    tearDown(() {});
    blocTest<NodeAddressCubit, NodeAddressState>(
      'Should init node address',
      build: () => nodeAddressCubit,
      act: (cubit) async {
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
