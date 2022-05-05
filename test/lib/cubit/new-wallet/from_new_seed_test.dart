import 'package:bitcoin/types.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sats/api/interface/logger.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/new-wallet/from-new-seed.dart';
import 'package:sats/cubit/new-wallet/common/seed-generate.dart';
import 'package:sats/cubit/wallets.dart';

import 'package:sats/model/result.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:test/test.dart';

class _MockStorage extends Mock implements IStorage {}

class _MockLogApi extends Mock implements ILogAPI {}

class _MockClipboard extends Mock implements IClipBoard {}

class _MockLibStackmate extends Mock implements IStackMateCore {}

void main() {
  group('SeedGenerateWalletCubit: Saves a new wallet from seed.', () {
    final IStorage _storage = _MockStorage();
    final IStackMateCore _bitcoin = _MockLibStackmate();
    final clipboard = _MockClipboard();
    final logAPI = _MockLogApi();
    final logger = Logger(clipboard, logAPI);
    final chainSelectCubit = ChainSelectCubit(_storage, logger);
    final _generateCubit =
        SeedGenerateCubit(_bitcoin, chainSelectCubit, logger);
    final _wallets =
        WalletsCubit(_storage, logger, chainSelectCubit, clipboard);
    late SeedGenerateWalletCubit seedGenerateWalletCubit;

    setUp(() async {
      seedGenerateWalletCubit = SeedGenerateWalletCubit(
        _bitcoin,
        _storage,
        logger,
        _wallets,
        chainSelectCubit,
        _generateCubit,
      );
    });

    tearDown(() {});
    blocTest<SeedGenerateWalletCubit, SeedGenerateWalletState>(
      'Clear Seed Generate State',
      build: () {
        return seedGenerateWalletCubit;
      },
      act: (cubit) async {
        cubit.close();
      },
      expect: () => <SeedGenerateWalletState>[],
      verify: (cubit) => [],
    );
  });
}
