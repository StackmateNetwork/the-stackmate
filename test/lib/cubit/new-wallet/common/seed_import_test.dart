import 'package:bitcoin/types.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sats/api/interface/logger.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/api/stackmate-core.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/new-wallet/common/seed-import.dart';
import 'package:sats/model/result.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:test/test.dart';

class _MockStorage extends Mock implements IStorage {}

class _MockLogApi extends Mock implements ILogAPI {}

class _MockClipboard extends Mock implements IClipBoard {}

void main() {
  group('seedImport: CORE OPS', () {
    final IStorage _storage = _MockStorage();
    final clipboard = _MockClipboard();
    final logAPI = _MockLogApi();
    final logger = Logger(clipboard, logAPI);
    final chainSelectCubit = ChainSelectCubit(_storage, logger);
    final IStackMateCore _bitcoin = BitcoinFFI();

    late SeedImportCubit seedImportCubit;

    const expectedSeed = Seed(
      'transfer spare party divorce screen used pole march warfare another balance find',
      '8099ce1e',
      'tprv8ZgxMBicQKsPctM9UgftwPdDCxMq2c57utsBu5htMG7ySHZzT33jWyiSBQJwvjDEoMHmZGFgezhVTyKmiKfdPtdFtoAAdSzFYdstokvpop1',
    );
    const DerivedKeys testDerivedAccount = DerivedKeys(
      '8099ce1e',
      'm/84h/1h/0h',
      'tprv8fVh3n3LQjFrTRXZYeZ9n8tvbEPshXqeRgauvZXXxn7117kDegj92XaHy9kVTH2zN9fXg8Ce4cpX5ihr9CBBAuA7DJSmdU2gVj3Xjd2T41G',
      'tpubDCBjCC5aZ6wXLtZMSJDkBYZ3AFuors2YzzBhD5ZqP3uPqbzzH5YjD2CA9HDhUYNhrqq67v4XAN93KSbSL4bwa5hEvidkFuj7ycWA7EYzp41',
    );

    setUp(() async {
      seedImportCubit = SeedImportCubit(
        logger,
        chainSelectCubit,
        _bitcoin,
      );
    });

    tearDown(() {});
    blocTest<SeedImportCubit, SeedImportState>(
      'Clear Seed Import State',
      build: () {
        return seedImportCubit;
      },
      act: (cubit) async {
        cubit.clear();
      },
      expect: () => <SeedImportState>[
        const SeedImportState(),
      ],
      verify: (cubit) => [],
    );
    blocTest<SeedImportCubit, SeedImportState>(
      'Import new wallet flow.',
      build: () {
        return seedImportCubit;
      },
      act: (cubit) async {
        cubit.backOnSeedClicked();
        cubit.backOnPassphaseClicked();
        cubit.passPhraseChanged('text');
        cubit.passPhraseChanged('');
        cubit.seedTextChanged(expectedSeed.mnemonic);
        cubit.checkPassPhrase();
        cubit.checkSeed();
      },
      expect: () => <SeedImportState>[
        const SeedImportState(
          currentStep: SeedImportStep.passphrase,
        ),
        const SeedImportState(
          passPhrase: 'text',
        ),
        const SeedImportState(
          passPhrase: '',
        ),
        SeedImportState(
          seedReady: false,
          seed: expectedSeed.mnemonic,
        ),
        SeedImportState(
          currentStep: SeedImportStep.import,
          seed: expectedSeed.mnemonic,
        ),
        SeedImportState(
          seedReady: true,
          currentStep: SeedImportStep.import,
          seed: expectedSeed.mnemonic,
          masterXpriv: expectedSeed.xprv,
          wallet: testDerivedAccount,
        ),
      ],
      verify: (cubit) => [],
    );
  });
}
