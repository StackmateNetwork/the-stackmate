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
  group('nodeCubit: Which node to connect to?', () {
    late IStorage _storage;
    late NodeAddressCubit nodeAddressCubit;

    setUp(() async {
      _storage = _MockStorage();
      nodeAddressCubit = NodeAddressCubit(_storage);
    });

    tearDown(() {});
    blocTest<NodeAddressCubit, NodeAddressState>(
      'WHEN init and storage is empty THEN default to blockstream testnet node.',
      build: () {
        when(
          () => _storage.getFirstItem<Node>(StoreKeys.Node.name),
        ).thenReturn(const R(error: 'empty'));

        return nodeAddressCubit;
      },
      act: (cubit) async {
        cubit.init();
      },
      expect: () => <NodeAddressState>[
        const NodeAddressState(
          address: blockstreamTestNetAddress,
          port: blockstreamTestNetPort,
        ),
      ],
      verify: (cubit) => [
        verify(() => _storage.getFirstItem<Node>(StoreKeys.Node.name))
            .called(1),
      ],
    );
  });
}
