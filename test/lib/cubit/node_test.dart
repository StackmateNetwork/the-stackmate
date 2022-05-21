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
    const myAltTestAddress = 'https://dummy.stackmate.net';
    const myNodeName = 'dummy';
    const node = Node(address: myAltTestAddress, name: myNodeName);

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
          address: defaultNodeAddress,
          name: defaultNodeAddress,
        ),
      ],
      verify: (cubit) => [
        verify(() => _storage.getFirstItem<Node>(StoreKeys.Node.name))
            .called(1),
      ],
    );

    blocTest<NodeAddressCubit, NodeAddressState>(
      'Editing and Saving flow.',
      build: () {
        when(() => _storage.clearAll<Node>(StoreKeys.Node.name))
            .thenAnswer((invocation) => Future.value(const R(result: true)));
        when(() => _storage.saveItem<Node>(StoreKeys.Node.name, node))
            .thenAnswer((invocation) => Future.value(const R(result: 1)));
        when(
          () => _storage.getFirstItem<Node>(StoreKeys.Node.name),
        ).thenReturn(const R(error: 'empty'));
        return nodeAddressCubit;
      },
      act: (cubit) async {
        cubit.toggleIsEditting();
        cubit.addressChanged(myAltTestAddress);
        cubit.nameChanged(myNodeName);
        cubit.saveClicked();
      },
      expect: () => <NodeAddressState>[
        const NodeAddressState(
          address: defaultNodeAddress,
          name: defaultNodeAddress,
          isEditing: true,
        ),
        const NodeAddressState(
          address: myAltTestAddress,
          name: defaultNodeAddress,
          isEditing: true,
        ),
        const NodeAddressState(
          address: myAltTestAddress,
          name: myNodeName,
          isEditing: true,
        ),
        const NodeAddressState(
          address: myAltTestAddress,
          name: myNodeName,
          isEditing: false,
        ),
      ],
      verify: (cubit) => [
        verify(() => _storage.clearAll<Node>(StoreKeys.Node.name)).called(1),
        verify(() => _storage.saveItem<Node>(StoreKeys.Node.name, node))
            .called(1),
      ],
    );
  });
}
