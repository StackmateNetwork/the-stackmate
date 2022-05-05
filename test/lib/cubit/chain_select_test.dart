import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sats/api/interface/logger.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/clipboard.dart';
import 'package:sats/pkg/interface/clipboard.dart';

import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/api/interface/logger.dart';

import 'package:test/test.dart';

class _MockStorage extends Mock implements IStorage {}

class _MockLogApi extends Mock implements ILogAPI {}

class _MockClipboard extends Mock implements IClipBoard {}

void main() {
  group('chainSelectCubit: Mainnet or Testnet?', () {
    late IStorage _storage;
    final clipboard = _MockClipboard();
    final logAPI = _MockLogApi();
    final logger = Logger(clipboard, logAPI);

    late ChainSelectCubit chainSelectCubit;

    setUp(() async {
      _storage = _MockStorage();
      chainSelectCubit = ChainSelectCubit(_storage, logger);
    });

    tearDown(() {});
    blocTest<ChainSelectCubit, BlockchainState>(
      'WHEN storage is empty THEN default to testnet on initialization.',
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
        const BlockchainState(blockchain: Blockchain.testNet),
      ],
      verify: (cubit) => [
        verify(() =>
                _storage.getFirstItem<Blockchain>(StoreKeys.Blockchain.name))
            .called(1),
      ],
    );
  });
}
