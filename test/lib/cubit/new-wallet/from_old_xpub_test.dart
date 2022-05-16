import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sats/api/interface/logger.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/api/stackmate-core.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/new-wallet/common/xpub-import.dart';
import 'package:sats/cubit/new-wallet/from-old-xpub.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/result.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/interface/clipboard.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';
import 'package:test/test.dart';

class _MockStorage extends Mock implements IStorage {}

class _MockLogApi extends Mock implements ILogAPI {}

class _MockClipboard extends Mock implements IClipBoard {}

void main() {
  group('XpubImportWalletCubit: Saves a new wallet from seed.', () {
    const labelChange = 'importLabel';

    final IStorage _storage = _MockStorage();
    final IStackMateCore _bitcoin = BitcoinFFI();
    final clipboard = _MockClipboard();
    final logAPI = _MockLogApi();
    final logger = Logger(clipboard, logAPI);
    final chainSelectCubit = ChainSelectCubit(_storage, logger);
    final nodeAddressCubit = NodeAddressCubit(_storage);

    final _wallets =
        WalletsCubit(_storage, logger, chainSelectCubit, clipboard);

    late XpubImportCubit _importCubit;
    late XpubImportWalletCubit xpubImportWalletCubit;

    setUp(() async {
      _importCubit = XpubImportCubit(logger, clipboard);
      xpubImportWalletCubit = XpubImportWalletCubit(
        _bitcoin,
        logger,
        _storage,
        _wallets,
        chainSelectCubit,
        nodeAddressCubit,
        _importCubit,
      );
    });

    tearDown(() {});

    blocTest<XpubImportWalletCubit, XpubImportWalletState>(
      'Basic Xpub Import Flow',
      build: () {
        return xpubImportWalletCubit;
      },
      act: (cubit) async {
        cubit.nextClicked();
        cubit.backClicked();
        cubit
            .nextClicked(); // this test currently shows that next will not update state
        cubit.nextClicked(); // update to label state comes from _importCubit
        cubit.labelChanged(labelChange);
      },
      expect: () => <XpubImportWalletState>[
        const XpubImportWalletState(
          currentStep: XpubImportWalletStep.import,
          label: labelChange,
          errSavingWallet: emptyString,
        ),
      ],
      verify: (cubit) => [],
    );
    blocTest<XpubImportWalletCubit, XpubImportWalletState>(
      'Close Xpub Import Wallet Cubit',
      build: () {
        return xpubImportWalletCubit;
      },
      act: (cubit) async {
        cubit.close();
      },
      expect: () => <XpubImportWalletState>[],
    );
  });
}
