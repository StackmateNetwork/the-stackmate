import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sats/api/interface/logger.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';
import 'package:test/test.dart';

class _MockStorage extends Mock implements IStorage {}

class _MockLogApi extends Mock implements ILogAPI {}

class _MockClipboard extends Mock implements IClipBoard {}

void main() {
  group('chainSelectCubit: Mainnet or Testnet?', () {
    final IStorage _storage = _MockStorage();
    final clipboard = _MockClipboard();
    final logAPI = _MockLogApi();
    final logger = Logger(clipboard, logAPI);

    late ChainSelectCubit chainSelectCubit;

    setUp(() async {
      chainSelectCubit = ChainSelectCubit(_storage, logger);
    });

    tearDown(() {});
    blocTest<ChainSelectCubit, BlockchainState>(
      'WHEN init and storage is empty THEN default to testnet.',
      build: () {
        when(
          () => _storage.getFirstItem<Blockchain>(StoreKeys.Blockchain.name),
        ).thenReturn(const R(error: 'empty'));

        return chainSelectCubit;
      },
      act: (cubit) async {
        cubit.init();
      },
      expect: () => <BlockchainState>[
        const BlockchainState(blockchain: Blockchain.test),
      ],
      verify: (cubit) => [
        verify(() =>
                _storage.getFirstItem<Blockchain>(StoreKeys.Blockchain.name))
            .called(1),
      ],
    );
    blocTest<ChainSelectCubit, BlockchainState>(
      'changeBlockchain flow.',
      build: () {
        when(
          () => _storage.saveItemAt<Blockchain>(
            StoreKeys.Blockchain.name,
            0,
            Blockchain.main,
          ),
        ).thenAnswer((_) => Future.value(const R(result: true)));
        when(
          () => _storage.saveItemAt<Blockchain>(
            StoreKeys.Blockchain.name,
            0,
            Blockchain.test,
          ),
        ).thenAnswer((_) => Future.value(const R(result: true)));
        return chainSelectCubit;
      },
      act: (cubit) async {
        cubit.changeBlockchain(Blockchain.main);
        cubit.changeBlockchain(Blockchain.test);
      },
      expect: () => <BlockchainState>[
        const BlockchainState(blockchain: Blockchain.main),
        const BlockchainState(blockchain: Blockchain.test),
      ],
      verify: (cubit) => [
        verify(
          () => _storage.saveItemAt<Blockchain>(
            StoreKeys.Blockchain.name,
            0,
            Blockchain.main,
          ),
        ).called(1),
        verify(
          () => _storage.saveItemAt<Blockchain>(
            StoreKeys.Blockchain.name,
            0,
            Blockchain.test,
          ),
        ).called(1),
      ],
    );
  });
}
