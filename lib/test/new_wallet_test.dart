import 'dart:ffi';

import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/new-wallet/common/seed-generate.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/_locator.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:sats/cubit/new-wallet/from-old-seed.dart';
import 'package:sats/cubit/new-wallet/from-new-seed.dart';

void main() {
  group('Seed Generate', () {
    late SeedGenerateWalletCubit seedGenerateWalletCubit;

    setUp(() {
      seedGenerateWalletCubit = SeedGenerateWalletCubit(
        locator<IStackMateCore>(),
        locator<IStorage>(),
        locator<Logger>(),
        locator<WalletsCubit>(),
        locator<ChainSelectCubit>(),
        locator<SeedGenerateCubit>(),
      );
    });
    test('Generate new mnemonic phrase', () {
      expect(true, false);
    });
  });
  group('Seed Recover', () {
    setUp(() {
      // seedGenerateWalletCubit = SeedGenerateWalletCubit();
    });
    test('Import a mnemonic phrase', () {
      expect(true, false);
    });
  });

  group('Watch-Only', () {
    test('Import a public key', () {
      expect(true, false);
    });
  });
}
