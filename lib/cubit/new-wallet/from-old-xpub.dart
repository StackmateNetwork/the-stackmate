import 'dart:async';

import 'package:bitcoin/types.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sats/api/interface/stackmate-core.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/logger.dart';
import 'package:sats/cubit/new-wallet/common/xpub-import.dart';
import 'package:sats/cubit/node.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/model/blockchain.dart';
import 'package:sats/model/result.dart';
import 'package:sats/model/wallet.dart';
import 'package:sats/pkg/interface/storage.dart';
import 'package:sats/pkg/storage.dart';

part 'from-old-xpub.freezed.dart';

enum XpubImportWalletStep { import, label }

@freezed
class XpubImportWalletState with _$XpubImportWalletState {
  const factory XpubImportWalletState({
    @Default(XpubImportWalletStep.import) XpubImportWalletStep currentStep,
    @Default('') String label,
    @Default(false) bool savingWallet,
    @Default('') String errSavingWallet,
    @Default(false) bool newWalletSaved,
  }) = _SeedImportXpubState;
  const XpubImportWalletState._();

  double completePercent() =>
      currentStep.index / XpubImportWalletStep.values.length;

  String completePercentLabel() =>
      ((currentStep.index / XpubImportWalletStep.values.length) * 100)
          .toStringAsFixed(0);

  String currentStepLabel() {
    switch (currentStep) {
      case XpubImportWalletStep.import:
        return 'Import XPub';
      case XpubImportWalletStep.label:
        return 'Label Wallet';
    }
  }

  bool canGoBack() => currentStep == XpubImportWalletStep.import;
}

class XpubImportWalletCubit extends Cubit<XpubImportWalletState> {
  XpubImportWalletCubit(
    // this._soloWalletAPI,
    this._core,
    this._logger,
    this._storage,
    this._wallets,
    this._blockchainCubit,
    this._nodeAddressCubit,
    this._importCubit,
  ) : super(const XpubImportWalletState()) {
    _importSub = _importCubit.stream.listen((istate) {
      if (istate.detailsReady) {
        emit(state.copyWith(currentStep: XpubImportWalletStep.label));
      }
    });
  }

  final Logger _logger;
  final IStorage _storage;
  final IStackMateCore _core;
  final WalletsCubit _wallets;
  final ChainSelectCubit _blockchainCubit;
  final NodeAddressCubit _nodeAddressCubit;
  final XpubImportCubit _importCubit;
  late StreamSubscription _importSub;

  static const invalidLabelError = 'Invalid Label';
  static const internalError = 'Internal Error';
  static const watcherWalletType = 'WATCHER';
  static const wpkhScript = 'wpkh';
  static const emptyString = '';

  void labelChanged(String text) {
    emit(state.copyWith(label: text, errSavingWallet: emptyString));
  }

  void nextClicked() async {
    switch (state.currentStep) {
      case XpubImportWalletStep.import:
        break;

      case XpubImportWalletStep.label:
        if (state.label == emptyString || state.label.length < 5) {
          emit(state.copyWith(errSavingWallet: invalidLabelError));
          return;
        }
        if (!state.savingWallet) _saveWallet();
        break;
    }
  }

  void backClicked() {
    switch (state.currentStep) {
      case XpubImportWalletStep.import:
        _importCubit.clear();
        break;
      case XpubImportWalletStep.label:
        emit(
          state.copyWith(
            currentStep: XpubImportWalletStep.import,
            label: emptyString,
          ),
        );
        break;
    }
  }

  void _saveWallet() async {
    emit(
      state.copyWith(
        savingWallet: true,
        errSavingWallet: emptyString,
      ),
    );

    try {
      final xpubState = _importCubit.state;
      final fingerprint = xpubState.fingerPrint;
      final path = xpubState.path;
      final xpub = xpubState.xpub;
      String fullXPub = xpub.replaceFirst('/*', emptyString);

      if (xpubState.hasNoKeySource())
        fullXPub = '[$fingerprint/$path]$xpub'.replaceFirst('/m', emptyString);

      final policy = 'pk($fullXPub/*)';

      const readable = 'pk(__primary__)';

      final descriptor = _core.compile(
        policy: policy,
        scriptType: wpkhScript,
      );
      if (descriptor.hasError) {
        throw SMError.fromJson(descriptor.error!);
      }
      var history = _core.getHistory(
        descriptor: descriptor.result!,
        nodeAddress: _nodeAddressCubit.toString(),
      );
      var recievedCount = 0;

      if (history.hasError) {
        history = const R(result: []);
      } else
        for (final item in history.result!) {
          if (item.sent == 0) {
            recievedCount++;
          }
        }

      var balance = _core.syncBalance(
        descriptor: descriptor.result!,
        nodeAddress: _nodeAddressCubit.toString(),
      );
      if (balance.hasError) {
        balance = const R(result: 0);
      }
      // check balance and see if last address index needs update
      var newWallet = Wallet(
        label: state.label,
        descriptor: descriptor.result!,
        policy: readable,
        requiredPolicyElements: 1,
        policyElements: ['primary:$fullXPub'],
        blockchain: _blockchainCubit.state.blockchain.name,
        walletType: watcherWalletType,
        lastAddressIndex: (recievedCount == 0) ? -1 : recievedCount,
        balance: balance.result!,
        transactions: [],
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

      _wallets.walletSelected(newWallet);
      _wallets.addTransactionsToSelectedWallet(history.result!);

      emit(
        state.copyWith(
          savingWallet: false,
          newWalletSaved: true,
        ),
      );
    } catch (e, s) {
      _logger.logException(e, 'SeedImportCubit._saveWallet', s);

      emit(
        state.copyWith(
          errSavingWallet: internalError,
          newWalletSaved: true,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _importSub.cancel();
    return super.close();
  }
}
