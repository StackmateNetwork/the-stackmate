import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/model/node.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';
import 'package:test/test.dart';

class _MockStorage extends Mock implements IStorage {}

void main() {
  group('nodeCubit', () {
    late IStorage _storage;
    late NodeAddressCubit nodeAddressCubit;

    setUp(() async {
      _storage = _MockStorage();
      nodeAddressCubit = NodeAddressCubit(_storage);
    });

    tearDown(() {});
    blocTest<NodeAddressCubit, NodeAddressState>(
      'Should init node address',
      build: () {
        const node = Node(
          address: 'electrum.blockstream.info',
          port: '60002',
        );
        const r = R(result: node);
        when(
          () => _storage.getFirstItem<Node>(StoreKeys.Node.name),
        ).thenReturn(r);

        return nodeAddressCubit;
      },
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
        verify(() => _storage.getFirstItem<Node>(StoreKeys.Node.name))
            .called(1),
      ],
    );
  });
}
