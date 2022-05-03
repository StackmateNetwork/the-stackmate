import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/fees.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/model/fees.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:test/test.dart';

class _MockStorage extends Mock implements IStorage {}

class _MockChain extends Mock implements ChainSelectCubit {}

class _MockNode extends Mock implements NodeAddressCubit {}

main() {
  group('feesCubit', () {
    late IStorage storage;
    late ChainSelectCubit blockchain;
    late NodeAddressCubit nodeAddressCubit;
    late FeesCubit feesCubit;

    setUp(() {
      storage = _MockStorage();
      blockchain = _MockChain();
      nodeAddressCubit = _MockNode();
      feesCubit = FeesCubit(storage, blockchain, nodeAddressCubit);
    });

    tearDown(() {});

    blocTest<FeesCubit, FeesState>('Should update fees',
        build: () => feesCubit,
        act: (cubit) {
          cubit.update();
        },
        expect: () => [
              FeesState(updating: true),
            ]);
  });
}
