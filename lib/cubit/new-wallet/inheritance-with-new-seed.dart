import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/new-wallet/common/seed-generate.dart';
import 'package:sats/cubit/new-wallet/common/xpub-import.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'inheritance-with-new-seed.freezed.dart';

enum InteritanceWithNewSeedWalletSteps {
  info,
  settings,
  seed,
  import,
  label,
  share,
}

@freezed
class InheritanceWithNewSeedState with _$InheritanceWithNewSeedState {
  const factory InheritanceWithNewSeedState({
    @Default(InteritanceWithNewSeedWalletSteps.info)
        InteritanceWithNewSeedWalletSteps currentStep,
    DateTime? date,
    @Default('') String errDate,
    @Default('') String walletLabel,
    @Default('') String errWalletLabel,
    @Default(false) bool savingWallet,
    @Default('') String errSavingWallet,
    @Default(false) bool newWalletSaved,
  }) = _InheritanceWithNewSeedState;
  const InheritanceWithNewSeedState._();
}

class InteritanceWithNewSeedCubit extends Cubit<InheritanceWithNewSeedState> {
  InteritanceWithNewSeedCubit(
    this._core,
    this._storage,
    this._logger,
    this._wallets,
    this._blockchainCubit,
    this._generateCubit,
    this._importCubit,
    this._nodeAddressCubit,
  ) : super(const InheritanceWithNewSeedState()) {
    _generateSub = _generateCubit.stream.listen((gstate) {
      if (gstate.wallet != null)
        emit(
          state.copyWith(
            currentStep: InteritanceWithNewSeedWalletSteps.import,
          ),
        );
    });
    _importSub = _importCubit.stream.listen((istate) {
      if (istate.detailsReady)
        emit(
          state.copyWith(
            currentStep: InteritanceWithNewSeedWalletSteps.label,
          ),
        );
    });
  }

  final IStackMateCore _core;

  final IStorage _storage;
  final Logger _logger;

  final WalletsCubit _wallets;
  final ChainSelectCubit _blockchainCubit;

  final SeedGenerateCubit _generateCubit;
  final XpubImportCubit _importCubit;

  late final StreamSubscription _generateSub;
  late final StreamSubscription _importSub;
  final NodeAddressCubit _nodeAddressCubit;

  void backClicked() {
    switch (state.currentStep) {
      case InteritanceWithNewSeedWalletSteps.info:
        break;
      case InteritanceWithNewSeedWalletSteps.settings:
        emit(
          state.copyWith(
            currentStep: InteritanceWithNewSeedWalletSteps.info,
          ),
        );
        break;

      case InteritanceWithNewSeedWalletSteps.seed:
        emit(
          state.copyWith(
            currentStep: InteritanceWithNewSeedWalletSteps.settings,
          ),
        );
        _generateCubit.clear();
        break;
      case InteritanceWithNewSeedWalletSteps.import:
        emit(
          state.copyWith(
            currentStep: InteritanceWithNewSeedWalletSteps.settings,
          ),
        );
        _importCubit.clear();
        _generateCubit.clear();

        break;

      case InteritanceWithNewSeedWalletSteps.label:
        emit(
          state.copyWith(
            currentStep: InteritanceWithNewSeedWalletSteps.settings,
          ),
        );
        _importCubit.clear();
        _generateCubit.clear();
        break;
      case InteritanceWithNewSeedWalletSteps.share:
        break;
    }
  }

  void nextClicked() {
    switch (state.currentStep) {
      case InteritanceWithNewSeedWalletSteps.info:
        emit(
          state.copyWith(
            currentStep: InteritanceWithNewSeedWalletSteps.settings,
          ),
        );

        break;
      case InteritanceWithNewSeedWalletSteps.settings:
        if (state.date == null || state.date!.isBefore(DateTime.now())) {
          emit(state.copyWith(errDate: 'Invalid Date Selected'));
          return;
        }
        emit(
          state.copyWith(
            currentStep: InteritanceWithNewSeedWalletSteps.seed,
          ),
        );
        break;

      case InteritanceWithNewSeedWalletSteps.seed:
      case InteritanceWithNewSeedWalletSteps.import:
      case InteritanceWithNewSeedWalletSteps.share:
        break;

      case InteritanceWithNewSeedWalletSteps.label:
        saveClicked();
        break;
    }
  }

  void dateSelected(DateTime date) =>
      emit(state.copyWith(date: date, errDate: ''));

  void labelChanged(String text) =>
      emit(state.copyWith(walletLabel: text, errWalletLabel: ''));

  void saveClicked() async {
    try {
      if (state.walletLabel.length < 4 ||
          state.walletLabel.length > 10 ||
          state.walletLabel.contains(' ')) {
        emit(state.copyWith(errWalletLabel: 'Invalid Label'));
        return;
      }

      final mainWallet = _generateCubit.state.wallet;
      if (mainWallet == null) return;

      final fullPrimaryXPrv =
          '[${mainWallet.fingerPrint}/${mainWallet.hardenedPath}]${mainWallet.xprv}';

      final fullPrimaryXPub =
          '[${mainWallet.fingerPrint}/${mainWallet.hardenedPath}]${mainWallet.xpub}';

      final mainPolicy = 'pk($fullPrimaryXPrv/0/*)'.replaceFirst('/m', '');

      final xpubState = _importCubit.state;
      final fingerprint = xpubState.fingerPrint;
      final path = xpubState.path;
      final xpub = xpubState.xpub;
      String fullSecondaryXPub = xpub;

      String backupSigner = '';
      if (xpubState.showOtherDetails())
        fullSecondaryXPub = '[$fingerprint/$path]$xpub';

      backupSigner = 'pk($fullSecondaryXPub/0/*)';
      final from = DateTime.now();
      final to = state.date!;
      final days = (to.difference(from).inHours / 24).round();
      final blocks = _core.daysToBlocks(days: days.toString());
      final currentHeight = _core.getHeight(
        network: _blockchainCubit.state.blockchain.name,
        nodeAddress: _nodeAddressCubit.state.getAddress(),
      );
      final height = currentHeight + blocks;
      final backupPolicy = 'and($backupSigner,after($height)))';

      // final combinedPolicy =
      //     'or($mainPolicy,and($backupPolicy,after($height)))';

      final combinedPolicy = 'thresh(1,$mainPolicy,$backupPolicy)';

      final policyElements = [
        fullPrimaryXPub,
        fullSecondaryXPub,
        height.toString()
      ];
      final com = _core.compile(
        policy: combinedPolicy,
        scriptType: 'wsh',
      );
      const readable =
          'thresh(1,__newbie__,and(__defender__,after(__some-time__)))';

      var newWallet = Wallet(
        label: state.walletLabel,
        descriptor: com.descriptor,
        policy: readable,
        requiredPolicyElements: 3,
        policyElements: policyElements,
        blockchain: _blockchainCubit.state.blockchain.name,
        walletType: 'INHERITANCE',
      );

      final savedId = await _storage.saveItem<Wallet>(
        StoreKeys.Wallet.name,
        newWallet,
      );

      if (savedId.hasError) return;

      final id = savedId.result!;
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
          currentStep: InteritanceWithNewSeedWalletSteps.share,
        ),
      );
    } catch (e, s) {
      _logger.logException(e, 'InteritanceWithNewSeedCubit.saveClicked', s);
    }
  }

  @override
  Future<void> close() {
    _importSub.cancel();
    _generateSub.cancel();
    return super.close();
  }
}
