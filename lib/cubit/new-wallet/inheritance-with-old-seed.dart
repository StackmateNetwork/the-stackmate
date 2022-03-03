import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/new-wallet/common/seed-import.dart';
import 'package:sats/cubit/new-wallet/common/xpub-import.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'inheritance-with-old-seed.freezed.dart';

enum InteritanceWithOldSeedWalletSteps {
  info,
  settings,
  seedimport,
  import,
  label,
  share,
}

@freezed
class InheritanceWithOldSeedState with _$InheritanceWithOldSeedState {
  const factory InheritanceWithOldSeedState({
    @Default(InteritanceWithOldSeedWalletSteps.info) InteritanceWithOldSeedWalletSteps currentStep,
    DateTime? date,
    @Default('') String errDate,
    @Default('') String walletLabel,
    @Default('') String errWalletLabel,
    @Default(false) bool savingWallet,
    @Default('') String errSavingWallet,
    @Default(false) bool newWalletSaved,
  }) = _InheritanceWithOldSeedState;
  const InheritanceWithOldSeedState._();
}

class InheritanceWithOldSeedCubit extends Cubit<InheritanceWithOldSeedState> {
  InheritanceWithOldSeedCubit(
    this._core,
    this._storage,
    this._logger,
    this._wallets,
    this._blockchainCubit,
    this._importSeedCubit,
    this._importXpubCubit,
    this._nodeAddressCubit,
  ) : super(const InheritanceWithOldSeedState()) {
    _importSeedSub = _importSeedCubit.stream.listen((gstate) {
      if (gstate.seedReady)
        emit(
          state.copyWith(
            currentStep: InteritanceWithOldSeedWalletSteps.import,
          ),
        );
    });
    _importXpubSub = _importXpubCubit.stream.listen((istate) {
      if (istate.detailsReady)
        emit(
          state.copyWith(
            currentStep: InteritanceWithOldSeedWalletSteps.label,
          ),
        );
    });
  }

  final IStackMateCore _core;

  final IStorage _storage;
  final LoggerCubit _logger;

  final WalletsCubit _wallets;
  final ChainSelectCubit _blockchainCubit;

  final SeedImportCubit _importSeedCubit;
  final XpubImportCubit _importXpubCubit;
  late StreamSubscription _importSeedSub;
  late StreamSubscription _importXpubSub;

  final NodeAddressCubit _nodeAddressCubit;

  void backClicked() {
    switch (state.currentStep) {
      case InteritanceWithOldSeedWalletSteps.info:
        break;
      case InteritanceWithOldSeedWalletSteps.settings:
        emit(
          state.copyWith(
            currentStep: InteritanceWithOldSeedWalletSteps.info,
          ),
        );
        break;
      case InteritanceWithOldSeedWalletSteps.seedimport:
        emit(
          state.copyWith(
            currentStep: InteritanceWithOldSeedWalletSteps.settings,
          ),
        );
        _importSeedCubit.clear();
        break;
      case InteritanceWithOldSeedWalletSteps.import:
        emit(
          state.copyWith(
            currentStep: InteritanceWithOldSeedWalletSteps.settings,
          ),
        );
        _importXpubCubit.clear();
        _importSeedCubit.clear();

        break;
      case InteritanceWithOldSeedWalletSteps.label:
        emit(
          state.copyWith(
            currentStep: InteritanceWithOldSeedWalletSteps.settings,
          ),
        );
        _importXpubCubit.clear();
        _importSeedCubit.clear();
        break;
      case InteritanceWithOldSeedWalletSteps.share:
        break;
    }
  }

  void nextClicked() {
    switch (state.currentStep) {
      case InteritanceWithOldSeedWalletSteps.info:
        emit(
          state.copyWith(
            currentStep: InteritanceWithOldSeedWalletSteps.settings,
          ),
        );
        break;
      case InteritanceWithOldSeedWalletSteps.settings:
        if (state.date == null || state.date!.isBefore(DateTime.now())) {
          emit(state.copyWith(errDate: 'Invalid Date Selected'));
          return;
        }
        emit(
          state.copyWith(
            currentStep: InteritanceWithOldSeedWalletSteps.seedimport,
          ),
        );
        break;
      case InteritanceWithOldSeedWalletSteps.seedimport:
      case InteritanceWithOldSeedWalletSteps.import:
      case InteritanceWithOldSeedWalletSteps.share:
        break;
      case InteritanceWithOldSeedWalletSteps.label:
        saveClicked();
        break;
    }
  }

  void dateSelected(DateTime date) => emit(state.copyWith(date: date, errDate: ''));

  void labelChanged(String label) {
    emit(
      state.copyWith(
        walletLabel: label,
        errWalletLabel: '',
      ),
    );
  }

  void saveClicked() async {
    try {
      if (state.walletLabel.length < 4 ||
          state.walletLabel.length > 10 ||
          state.walletLabel.contains(' ')) {
        emit(state.copyWith(errWalletLabel: 'Invalid Label'));
        return;
      }

      final imsState = _importSeedCubit.state;
      final mainWallet = imsState.wallet;
      if (mainWallet == null) return;
      final mainPolicy =
          'pk([${mainWallet.fingerPrint}/${mainWallet.hardenedPath}]${mainWallet.xprv}/0/*)'
              .replaceFirst('/m', '');

      final xpubState = _importXpubCubit.state;
      final fingerprint = xpubState.fingerPrint;
      final path = xpubState.path;
      final xpub = xpubState.xpub;
      String backupPolicy = '';
      if (!xpubState.showOtherDetails())
        backupPolicy = 'pk($xpub/0/*)';
      else
        backupPolicy = 'pk([$fingerprint/$path]$xpub/0/*)'.replaceFirst('/m', '');

      final from = DateTime.now();
      final to = state.date!;
      final days = (to.difference(from).inHours / 24).round();
      final blocks = _core.daysToBlocks(days: days.toString());
      final currentHeight = _core.getHeight(
        network: _blockchainCubit.state.blockchain.name,
        nodeAddress: _nodeAddressCubit.state.getAddress(),
      );
      final height = currentHeight + blocks;

      // final combinedPolicy =
      //     'or($mainPolicy,and($backupPolicy, after($height)))';

      final combinedPolicy = 'thresh(1,$mainPolicy,and($backupPolicy,after($height)))';

      final com = _core.compile(
        policy: combinedPolicy,
        scriptType: 'wsh',
      );

      final exportWallet = _core.deriveHardened(
        masterXPriv: _importSeedCubit.state.masterXpriv!,
        account: '',
        purpose: '92',
      );

      var newWallet = Wallet(
        label: state.walletLabel,
        mainWallet: InternalWallet(
          xPub: mainWallet.xpub,
          fingerPrint: mainWallet.fingerPrint,
          path: mainWallet.hardenedPath,
          descriptor: com.descriptor.split('#')[0],
        ),
        exportWallet: InternalWallet(
          xPub: exportWallet.xpub,
          fingerPrint: exportWallet.fingerPrint,
          path: exportWallet.hardenedPath,
        ),
        blockchain: _blockchainCubit.state.blockchain.name,
        walletType: 'INHERITANCE',
      );

      final id = await _storage.saveItem<Wallet>(
        StoreKeys.Wallet.name,
        newWallet,
      );

      newWallet = newWallet.copyWith(id: id);

      await _storage.saveItemAt<Wallet>(
        StoreKeys.Wallet.name,
        id,
        newWallet,
      );

      _wallets.refresh();

      emit(
        state.copyWith(
          savingWallet: false,
          newWalletSaved: true,
          currentStep: InteritanceWithOldSeedWalletSteps.share,
        ),
      );
    } catch (e, s) {
      _logger.logException(e, 'InheritanceWithOldSeedCubit.saveClicked', s);
    }
  }

  @override
  Future<void> close() {
    _importSeedSub.cancel();
    _importXpubSub.cancel();
    return super.close();
  }
}
