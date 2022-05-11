import 'package:bitcoin/bitcoin.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sats/api/interface/logger.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/api/stackmate-core.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/new-wallet/common/seed-generate.dart';
import 'package:sats/cubit/new-wallet/from-new-seed.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/result.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';
import 'package:test/test.dart';
import 'package:sats/model/blockchain.dart';

class _MockStorage extends Mock implements IStorage {}

class _MockLogApi extends Mock implements ILogAPI {}

class _MockClipboard extends Mock implements IClipBoard {}

class _MockLibStackmate extends Mock implements IStackMateCore {}

class _MockGenerateCubit extends Mock implements SeedGenerateCubit {}

void main() {
  group('SeedGenerateWalletCubit: Saves a new wallet from seed.', () {
    final IStorage _storage = _MockStorage();
    final IStackMateCore _bitcoin = BitcoinFFI();
    final clipboard = _MockClipboard();
    final logAPI = _MockLogApi();
    final logger = Logger(clipboard, logAPI);
    final chainSelectCubit = ChainSelectCubit(_storage, logger);
    final _wallets =
        WalletsCubit(_storage, logger, chainSelectCubit, clipboard);

    late SeedGenerateCubit _generateCubit;
    late SeedGenerateWalletCubit seedGenerateWalletCubit;

    DerivedKeys testDerivedAccount = const DerivedKeys(
      '8099ce1e',
      'm/84h/1h/0h',
      'tprv8fVh3n3LQjFrTRXZYeZ9n8tvbEPshXqeRgauvZXXxn7117kDegj92XaHy9kVTH2zN9fXg8Ce4cpX5ihr9CBBAuA7DJSmdU2gVj3Xjd2T41G',
      'tpubDCBjCC5aZ6wXLtZMSJDkBYZ3AFuors2YzzBhD5ZqP3uPqbzzH5YjD2CA9HDhUYNhrqq67v4XAN93KSbSL4bwa5hEvidkFuj7ycWA7EYzp41',
    );

    const labelChange = 'newLabel';
    const expPublicDesc =
        'wpkh([8099ce1e/84h/1h/0h]tpubDCBjCC5aZ6wXLtZMSJDkBYZ3AFuors2YzzBhD5ZqP3uPqbzzH5YjD2CA9HDhUYNhrqq67v4XAN93KSbSL4bwa5hEvidkFuj7ycWA7EYzp41/*)';
    const expPrivateDesc =
        'wpkh([8099ce1e/84h/1h/0h]tprv8fVh3n3LQjFrTRXZYeZ9n8tvbEPshXqeRgauvZXXxn7117kDegj92XaHy9kVTH2zN9fXg8Ce4cpX5ihr9CBBAuA7DJSmdU2gVj3Xjd2T41G/*)';

    const Wallet testWallet = Wallet(
      label: labelChange,
      descriptor: expPrivateDesc,
      policy: 'pk(___primary___)',
      blockchain: 'testnet',
      policyElements: [
        'primary:[8099ce1e/84h/1h/0h]tpubDCBjCC5aZ6wXLtZMSJDkBYZ3AFuors2YzzBhD5ZqP3uPqbzzH5YjD2CA9HDhUYNhrqq67v4XAN93KSbSL4bwa5hEvidkFuj7ycWA7EYzp41'
      ],
      requiredPolicyElements: 1,
      walletType: 'SIGNER',
      lastAddressIndex: 0,
    );

    setUp(() async {
      _generateCubit = SeedGenerateCubit(_bitcoin, chainSelectCubit, logger);
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
      'Check Navigation',
      setUp: () {
        // when(() => _generateCubit.clear()).thenReturn(true);

        // whenListen(
        //   _generateCubit,
        //   Stream<SeedGenerateState>.fromIterable([
        //     const SeedGenerateState(),
        //     SeedGenerateState(
        //       currentStep: SeedGenerateSteps.quiz,
        //       wallet: testDerivedAccount,
        //     ),
        //   ]),
        // );

        // when(() => _generateCubit.state.wallet).thenReturn(testDerivedAccount);

        // when(() => _bitcoin.compile(policy: '', scriptType: wpkhScript))
        //     .thenReturn(const R(result: testDescriptor));
        // when(
        //   () => _storage.saveItem<Wallet>(
        //     StoreKeys.Wallet.name,
        //     testWallet,
        //   ),
        // ).thenAnswer(
        //   (_) => Future.value(
        //     const R(result: 1),
        //   ),
        // );
        // when(
        //   () => _storage.saveItemAt<Wallet>(
        //     StoreKeys.Wallet.name,
        //     1,
        //     testWallet,
        //   ),
        // ).thenAnswer(
        //   (invocation) => Future.value(
        //     const R(result: true),
        //   ),
        // );
        // when(
        //   () => _wallets.refresh(),
        // ).thenAnswer(
        //   (invocation) => Future.value(
        //     const R(result: true),
        //   ),
        // );
      },
      build: () {
        return seedGenerateWalletCubit;
      },
      act: (cubit) async {
        cubit.nextClicked();
        cubit.backClicked();
        cubit.nextClicked();
        cubit.labelChanged(labelChange);
        // cubit.saveClicked();
      },
      expect: () => <SeedGenerateWalletState>[
        const SeedGenerateWalletState(
          currentStep: SeedGenerateWalletSteps.generate,
        ),
        const SeedGenerateWalletState(
          currentStep: SeedGenerateWalletSteps.warning,
        ),
        const SeedGenerateWalletState(
          currentStep: SeedGenerateWalletSteps.generate,
        ),
        const SeedGenerateWalletState(
          currentStep: SeedGenerateWalletSteps.generate,
          walletLabel: labelChange,
          walletLabelError: emptyString,
        ),
      ],
      verify: (cubit) => [],
    );
    blocTest<SeedGenerateWalletCubit, SeedGenerateWalletState>(
      'Close Seed Generate Wallet Cubit',
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